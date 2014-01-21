require "spec_helper"
describe EasyThreadpool::Pool do

  let(:pool)   { Thread.pool(1) }
  let(:task)   { lambda { } }
  after(:each) { pool.shutdown }
  subject {pool}

  it 'should create a pool of ten threads' do
    expect(subject.size).to eq(1)
  end

  it 'should consume a task' do
    pool.process {task}
    pool.shutdown
    expect(subject.task_consumed).to eq(1)
  end
  
end