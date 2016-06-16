module ViewsHelper
  def active_if(matcher)
    return "active" if matcher == params['controller']
  end
end
