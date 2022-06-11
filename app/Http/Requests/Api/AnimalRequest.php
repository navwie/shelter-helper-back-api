<?php

namespace App\Http\Requests\Api;

use Illuminate\Foundation\Http\FormRequest;

class AnimalRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'name' => ['string', 'required', 'max:255'],
            'gender' => ['string', 'required','max:64'],
            'photo' => ['required'],
            'type' => ['string', 'required','max:64'],
            'weight' => ['required', 'regex:/^[0-9]+(\.[0-9][0-9]?)?$/'],
            'shelter_id' => ['required','exists:shelters,id'],
            'sterilized' => ['boolean', 'required'],
            'description' => ['string', 'required', 'max:64'],
            'birthday' => ['date', 'required'],
            'is_archive' => ['date'],
            'booked' => ['date'],
            'booked_user_id' => ['string', 'exists:users,id'],
        ];

    }
}
