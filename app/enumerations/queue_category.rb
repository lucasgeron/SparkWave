class QueueCategory < EnumerateIt::Base
  associate_values(
    :normal,
    :priority,
    :pediatric
  )
end
