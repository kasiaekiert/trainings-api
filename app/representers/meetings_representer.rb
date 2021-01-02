class MeetingsRepresenter
  def initialize(meetings)
    @meetings = meetings
  end

  def as_json
    meetings.map do |meeting|
      {
        id: meeting.id,
        title: meeting.title,
        author_first_name: meeting.author.first_name,
        author_last_name: meeting.author.last_name,
        author_name: author_name(meeting),
        author_section: meeting.author.section
      }
    end
  end

  private

  attr_reader :meetings

  def author_name(meeting)
    "#{meeting.author.first_name}" "#{meeting.author.last_name}"
  end
end