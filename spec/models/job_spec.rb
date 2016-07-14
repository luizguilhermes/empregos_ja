require "rails_helper"

describe Job do
  it 'should be valid' do
    job = Job.create()
    expect(job).not_to be_valid
    expect(job.errors[:title]).to include("can't be blank")
    expect(job.errors[:location]).to include("can't be blank")
    expect(job.errors[:description]).to include("can't be blank")
    expect(job.errors[:category]).to include("can't be blank")
  end

  context '#featured?' do
    it 'is featured' do
      job = Job.new(featured: true)

      expect(job).to be_featured
      expect(job.featured?).to eq true
    end

    it 'is not featured' do
      job = Job.new

      expect(job).to_not be_featured
      expect(job.featured?).to eq false
    end
  end
end
