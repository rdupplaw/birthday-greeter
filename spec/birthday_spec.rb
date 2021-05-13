require 'birthday'

describe Birthday do
  describe '#anniversary?' do
    context 'when birthday is today' do
      let(:birthday) { Birthday.today }
      let(:today) { double(:today, yday: birthday.yday) }
      let(:not_today) { double(:not_today, yday: birthday.yday + 1) }

      context 'when not given a date' do
        it 'defaults to todays date and returns true' do
          expect(birthday.anniversary?).to eq(true)
        end
      end

      context 'when given a date which is today' do
        it 'returns true' do
          expect(birthday.anniversary?(today)).to eq(true)
        end
      end

      context 'when given a date which is not today' do
        it 'returns false' do
          expect(birthday.anniversary?(not_today)).to eq(false)
        end
      end
    end

    context 'when birthday is not today' do
      let(:birthday) { Birthday.today + 1 }
      let(:today) { double(:today, yday: Birthday.today.yday) }
      let(:same_day_as_birthday) { double(:today, yday: birthday.yday) }
      let(:not_same_day_as_birthday) { double(:not_today, yday: birthday.yday + 1) }

      context 'when not given a date' do
        it 'defaults to todays date and returns false' do
          expect(birthday.anniversary?).to eq(false)
        end
      end

      context 'when given a date which is today' do
        it 'returns false' do
          expect(birthday.anniversary?(today)).to eq(false)
        end
      end

      context 'when given a date which is the same as birthday' do
        it 'returns true' do
          expect(birthday.anniversary?(same_day_as_birthday)).to eq(true)
        end
      end

      context 'when given a date which is not today and not birthday' do
        it 'returns false' do
          expect(birthday.anniversary?(not_same_day_as_birthday)).to eq(false)
        end
      end
    end
  end
end
