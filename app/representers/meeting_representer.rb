class MeetingRepresenter
  def initialize(meeting)
    @meeting = meeting
  end

  def as_json
    {
      id: meeting.id,
      title: meeting.title,
      author_name: author_name(meeting),
      author_section: meeting.author.section
    }
  end

  private

  attr_reader :meeting

  def author_name(meeting)
    "#{meeting.author.first_name}" "#{meeting.author.last_name}"
  end
end