shared_examples_for "success http request" do |options|
  it "returns 200" do
    action
    expect(response.code).to eq('200')
  end

  it "renders a valid template" do
    action
    expect(response).to render_template(options[:template])
  end
end

shared_examples_for "unauthorized http request" do
  it "redirects to the new session url" do
    action
    expect(response).to redirect_to(new_user_session_url)
  end
end
