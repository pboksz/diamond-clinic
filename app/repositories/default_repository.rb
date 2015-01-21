class DefaultRepository
  attr_reader :klass

  def initialize(klass)
    @klass = klass
  end

  def all
    klass.all
  end

  def new(attributes = {})
    klass.new(attributes)
  end

  def find(id)
    klass.where(id: id).first
  end

  def create(attributes)
    klass.create(attributes)
  end

  def update(id, attributes)
    find(id).update_attributes(attributes)
  end

  def destroy(id)
    find(id).destroy
  end
end
