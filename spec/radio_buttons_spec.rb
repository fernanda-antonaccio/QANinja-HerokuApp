
describe 'Radio Buttons', :radios do

    before(:each) do
        visit '/radios'
    end

    it 'Selecionar com ID', :radios_id do
        choose('cap')
        choose('thor')
    end

    it 'Selecionar com find e css selector', :radios_css do
        find('input[value=guardians]').click
        find('input[value=black-panther]').click
    end
end