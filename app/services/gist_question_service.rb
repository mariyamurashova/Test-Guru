class GistQuestionService

  RESPONSE_STATUS = 201

  def initialize(question, client: nil)
    @question = question 
    @test = @question.test 
    @client ||= Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    @client.last_response.status == RESPONSE_STATUS
  end

  private

  def gist_params
    {
      description: "A question about #{@test.title} from TestGuru",
      'public': true,
      files: 
          {'tets-guru-question.txt': 
            {
              content: gist_content
            }
          }
    }

  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n") 
  end


end
