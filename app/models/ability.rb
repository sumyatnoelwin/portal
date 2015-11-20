class Ability
  include CanCan::Ability

  def initialize(current_user)

    user = current_user || User.new
    if user.role == 'Admin'
        can :manage, :all
    elsif user.role == 'Student'
        can :read, [Ebook, ExamList, Result, StudentRegister, Timetable]
        can :manage, [Forum, Student]
    elsif user.role == 'Staff'
        can :manage, [Category, Ebook, Room, Staff, StudentRegister, Student, Timetable]
        can :read, [Course, Subject, Section, ExamList, Result]
    elsif user.role == 'Lecturer'
        can :manage, [Course, Ebook, Lecturer, Subject, Section, ExamList, Result, Timetable]
        can :read, [Category, Room, StudentRegister, Student]
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
