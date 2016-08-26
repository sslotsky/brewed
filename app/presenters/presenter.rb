class Presenter
  def self.collection(objects, **args)
    objects.map { |object| self.single(object, args) }
  end

  def self.single(object, **args)
    if args.any?
      self.new(object).as_json(**args)
    else
      self.new(object).as_json
    end
  end
end