# frozen_string_literal: true

module DocktorAppointmentManagement
  class RecordPatientArrivalsAndRepartures
    include ActiveModel::Model
    attr_reader :token, :category, :kind, :callbacks, :instance

    validate :validations

    def self.perform(token, category, kind, callbacks)
      new(token, category, kind, callbacks).call
    end

    def initialize(token, category, kind, callbacks)
      @token = token
      @category = category
      @kind = kind
      @callbacks = callbacks
    end

    def call
      if valid?
        kind.eql?('entry') ? register_admission : check_out
      else
        callbacks[:error]&.call(self)
      end
    end

    private

    def health_unit
      @health_unit ||= App::HealthUnit.find_by(token: token)
    end

    def check_out
      user = queue.users.where(finished: false).first

      user.nil? ? error_register_checkout : register_checkout(user)
    end

    def error_register_checkout
      errors.add(:base, 'Essa fila não possui pacientes')

      callbacks[:error]&.call(self)
    end

    def register_checkout(user)
      user.update(finished: true)

      callbacks[:success]&.call(message: 'success registered departure')
    end

    def register_admission
      create_user

      callbacks[:success]&.call({ message: 'successfully registered entry' })
    end

    def queue
      @queue ||= find_queue.present? ? find_queue : create_queue
    end

    def find_queue
      health_unit.queues&.find_by(category: category)
    end

    def create_queue
      App::Queue.create(health_unit_id: health_unit.id, category: category)
    end

    def create_user
      App::User.create(finished: false, queue_id: queue.id)
    end

    def merge_instance_errors
      return if instance.nil?

      errors.attribute_names.each do |key|
        instance.errors.add(key, errors[key].join(', ').to_s) unless instance.errors.include?(key)
      end
    end

    def validations
      if token.nil? || category.nil? || kind.nil?
        errors.add(:base, 'Você precisa informar os campos')
      elsif health_unit.nil?
        errors.add(:base, 'Token inválido')
      elsif !App::Queue::CATEGORIES.include?(category)
        errors.add(:base, 'Essa categoria não está incluída na lista')
      elsif queue.nil?
        errors.add(:base, 'Problema ao criar fila')
      end
    end
  end
end
