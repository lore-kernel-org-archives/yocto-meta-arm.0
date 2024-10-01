Return-Path: <radian.dc@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01AC4CEB2DA
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 01:56:56 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.71701.1727747806520385929
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 30 Sep 2024 18:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FU22kqbP;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: radian.dc@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37cdac05af9so2832555f8f.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 30 Sep 2024 18:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727747805; x=1728352605; darn=lists.yoctoproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=th+y5/9OtoDcsQFwOviqE/tKCjgVeTd0LkpVMnYKQqY=;
        b=FU22kqbPnA2nWvFf4wLeG/QeQl+haCx9HYQzMusSiiWjkL/oiO01rY2HRDGAz/eMaS
         uIMQKqxCjfKOhuNDKEbQBQJPrwtLu7WfqgTR/0R8GvTBcUvOCQmk8SUnzD6WAQaf8HmX
         v3gwPRe+sb+s8KmI810OuFcZ+5XUaeabaqUYfsXi58iNa5GTvYL/nMQKmfst/S9zmwqL
         Zc5pQopRQH02DJCqe92vDss0EEU6FEI2KUVldKmfxI+7S1juvVAJOGHXcoKWnUz8cnIa
         bvLG07G10rrpB0dotXdl51DVw5IAKgNBk+Wo3lwSaxft2KxMOFz9ScvOO/g86ruOHUk/
         D3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727747805; x=1728352605;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=th+y5/9OtoDcsQFwOviqE/tKCjgVeTd0LkpVMnYKQqY=;
        b=ou9Pk4CxTKG3Y/l/9qQO/n7aOtVykp5V7fzRDPOuWbHW4CNKn0iE5gDVEsgTTSWC/M
         dUEInwrgE86zgsd3adr0QpRdH17AdqD7wHoJ4nRMRc3Pf6r3Uh0mmGzwpMEEDfzbksN8
         SPQ2vVwq7FOEn6QV51mItWZ7hZH1fNvtEIgNBlx0WPAnVhG2H89v5jyhk+nkmxKN8Zpo
         kQeUeZXyJSua+FMYb90EzvZHUGwpiOPGghC9dii3ExFHVrU+2GEQEdWL65krII2L1YxD
         hr9VfF2aBmOUVNX8gIsYCh/ijYXbQjJY8BirkagksLYH16srO8bErRiTsP1YNoSQWQQc
         bTkA==
X-Forwarded-Encrypted: i=1; AJvYcCVN7xxIlIWDE1Jbg0OOtJ3zFj8sJU/oqaiGsbnnGPGLKZA8ScMl3BfVBEr7eF0W5io06N1PaKQ//w==@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzPd1p1e5WtqDshq0/cMtF5ElUzijnI7l+TXJUMZhUsiWumQATg
	S3yCToi7RDHNFBo23oUyG03RUw0iPl/w/W9fs7vMDgWVF3KuAl0D
X-Google-Smtp-Source: AGHT+IFAlRMk2ni5U70mP5rwVV+sIU/lYmGUaT/MYcxGoX7bBM++9wLAgHwB5kTdCwJfcQg9l2YrIQ==
X-Received: by 2002:a5d:49c2:0:b0:37c:d270:e5cf with SMTP id ffacd0b85a97d-37cd5aa6ce1mr11110277f8f.33.1727747804547;
        Mon, 30 Sep 2024 18:56:44 -0700 (PDT)
Received: from [192.168.1.60] (176-136-226-28.abo.bbox.fr. [176.136.226.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c299ac82sm614834066b.217.2024.09.30.18.56.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 18:56:43 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------KkGP6mIxhZW1XWSbM5rr007a"
Message-ID: <c5d876bf-2c3e-4fe2-8ebb-92dec0a0a3f5@gmail.com>
Date: Tue, 1 Oct 2024 03:56:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] trusted-firmware-a: fix build error when using ccache
To: Jon Mason <jdmason@kudzu.us>, Javier Tia <javier.tia@linaro.org>
Cc: Adrian DC <radian.dc@gmail.com>, meta-arm@lists.yoctoproject.org,
 Jon Mason <jon.mason@arm.com>
References: <20240928155436.1145975-1-radian.dc@gmail.com>
 <ZvqvFhYoRXQ9RQ4H@kudzu.us> <7afc0d4f-cf91-4750-93a3-3fc9c9a1b364@linaro.org>
 <CAPoiz9xr1DyEP-XWCRK_uhShDbb0kRrfcw8V8PL_CGwcCAP2PA@mail.gmail.com>
Content-Language: en-GB
From: Adrian DC <radian.dc@gmail.com>
In-Reply-To: <CAPoiz9xr1DyEP-XWCRK_uhShDbb0kRrfcw8V8PL_CGwcCAP2PA@mail.gmail.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 01 Oct 2024 01:56:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6152

This is a multi-part message in MIME format.
--------------KkGP6mIxhZW1XWSbM5rr007a
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Sorry I wasn't available to respond earlier.

Apparently the details I added after the initial send got lost.

- Original commit : nanbield and scarthgap 
(f2efb2a45610216cb6c2d72bdb5d5e61b990064a as you pointed out)
- Missing on : kirkstone and mickledore
- Tested on : kirkstone with CCache enabled

The cherry-pick was over kirkstone, without any changes except 
validation hence signoff (old Android System habits),
proposal was to apply the fix on kirkstone (being LTS and used by most 
SOM providers for now).

Thanks for your concern,

*Adrian DC*


On 01/10/2024 01:02, Jon Mason wrote:
> On Mon, Sep 30, 2024 at 6:47 PM Javier Tia<javier.tia@linaro.org>  wrote:
>> Hi,
>>
>> On 9/30/24 8:00 AM, Jon Mason wrote:
>>> On Sat, Sep 28, 2024 at 05:54:36PM +0200, Adrian DC wrote:
>>>> From: Javier Tia<javier.tia@linaro.org>
>>>>
>>>> When ccache is enabled trusted-firmware-a recipe fails with this
>>>> error message:
>>>>
>>>>       make: *** No rule to make target 'aarch64-poky-linux-gcc'. Stop.
>>>>
>>>> ccache prefix CC variable with 'ccache' word before compiler. Because
>>>> there are no quotes assigned to CC, only 'ccache' is assigned. The
>>>> compiler becomes a make target, producing the build error.
>>>>
>>>> Add single quotes to LD is a good measure to prevent this kind of error.
>>>>
>>>> Signed-off-by: Javier Tia<javier.tia@linaro.org>
>>>> Signed-off-by: Jon Mason<jon.mason@arm.com>
>>>> Signed-off-by: Adrian DC<radian.dc@gmail.com>
>>> I have questions about this patch's origins, given the above s-o-b's.
>>> Signed-off-by's state an authorship or handling (see Developer’s
>>> Certificate of Origin).  Since I have not seen this patch, I should
>>> not be listed.  It's on me to add my s-o-b.  Also, the ordering tends
>>> to matter, as each person handling the patch adds their s-o-b at the
>>> end of the patch.  So, you should be second, since you are taking this
>>> from Javier and submitting it for him (nd I would be last since
>>> I'mtaking it from you).
>>>
>>> Also, this feels like it needs a "Fixes:" line.  So, I know how far to
>>> pull this back in the stable branches.
>>>
>>> Finally, I find it weird that Javier isn't submitting this himself.
>>> Javier appears to be the author, and it includes his Linaro emaila
>>> ddress, and you are sending it from a gmail account.  Are you
>>> co-authors?  Are you sending it with his approval because he is
>>> busy/vacationing/ill?
>>>
>>> Overall the patch is fine and I would normally include it, but this is
>>> weird to me.  If Javier acks it to confirm his authoer, then I'll move
>>> my s-o-b to the end and include it.
>> Oh, this is a surprise.
>>
>> Jon has a good point.
>>
>> I have not approved sending this patch on my behalf. Yes, it looks like I am the original author because I recall fixing some issues around ccache a time ago; maybe last year if I remember correctly. But, before I acked it, I would like to know from where it was taken to have a bit more context. URL? Was the patch accepted or rejected?
> I think I know what might've happened.  It's already in the tree
> (commit f2efb2a45610216cb6c2d72bdb5d5e61b990064a).
> I'm guessing that Adrian accidentally sent it to this list while
> trying to backport it to an older release.  I got overly concerned
> with the s-o-b lines and didn't think to check what it wasn't applying
> :)
>
> Anyway, I think we can disregard this.
>
> Thanks,
> Jon
>
>>    >
>>> Jon
>>>
>>>
>>>> ---
>>>>    .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc     | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
>>>> index 2e3b50c5..5d3da59b 100644
>>>> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
>>>> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
>>>> @@ -101,9 +101,9 @@ def remove_options_tail (in_string):
>>>>        from itertools import takewhile
>>>>        return ' '.join(takewhile(lambda x: not x.startswith('-'), in_string.split(' ')))
>>>>
>>>> -EXTRA_OEMAKE +="LD=${@remove_options_tail(d.getVar('LD'))}"
>>>> +EXTRA_OEMAKE +="LD='${@remove_options_tail(d.getVar('LD'))}'"
>>>>
>>>> -EXTRA_OEMAKE +="CC=${@remove_options_tail(d.getVar('CC'))}"
>>>> +EXTRA_OEMAKE +="CC='${@remove_options_tail(d.getVar('CC'))}'"
>>>>
>>>>    # Verbose builds, no -Werror
>>>>    EXTRA_OEMAKE += "V=1 E=0"
>>>> --
>>>> 2.43.0
>>>>
>>>>
>> Thanks,
>>
>> » Javier Tia 🖋

--------------KkGP6mIxhZW1XWSbM5rr007a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Hi,<br>
    <br>
    Sorry I wasn't available to respond earlier.<br>
    <br>
    Apparently the details I added after the initial send got lost.<br>
    <br>
    - Original commit : nanbield and scarthgap
    (f2efb2a45610216cb6c2d72bdb5d5e61b990064a as you pointed out)<br>
    - Missing on : kirkstone and mickledore<br>
    - Tested on : kirkstone with CCache enabled<br>
    <br>
    The cherry-pick was over kirkstone, without any changes except
    validation hence signoff (old Android System habits),<br>
    proposal was to apply the fix on kirkstone (being LTS and used by
    most SOM providers for now).<br>
    <br>
    Thanks for your concern,<br>
    <br>
    <div class="moz-signature"><b>Adrian DC</b>
      <br>
      <br>
      <br>
    </div>
    <div class="moz-cite-prefix">On 01/10/2024 01:02, Jon Mason wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAPoiz9xr1DyEP-XWCRK_uhShDbb0kRrfcw8V8PL_CGwcCAP2PA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Mon, Sep 30, 2024 at 6:47 PM Javier Tia <a class="moz-txt-link-rfc2396E" href="mailto:javier.tia@linaro.org">&lt;javier.tia@linaro.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Hi,

On 9/30/24 8:00 AM, Jon Mason wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Sat, Sep 28, 2024 at 05:54:36PM +0200, Adrian DC wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">From: Javier Tia <a class="moz-txt-link-rfc2396E" href="mailto:javier.tia@linaro.org">&lt;javier.tia@linaro.org&gt;</a>

When ccache is enabled trusted-firmware-a recipe fails with this
error message:

     make: *** No rule to make target 'aarch64-poky-linux-gcc'. Stop.

ccache prefix CC variable with 'ccache' word before compiler. Because
there are no quotes assigned to CC, only 'ccache' is assigned. The
compiler becomes a make target, producing the build error.

Add single quotes to LD is a good measure to prevent this kind of error.

Signed-off-by: Javier Tia <a class="moz-txt-link-rfc2396E" href="mailto:javier.tia@linaro.org">&lt;javier.tia@linaro.org&gt;</a>
Signed-off-by: Jon Mason <a class="moz-txt-link-rfc2396E" href="mailto:jon.mason@arm.com">&lt;jon.mason@arm.com&gt;</a>
Signed-off-by: Adrian DC <a class="moz-txt-link-rfc2396E" href="mailto:radian.dc@gmail.com">&lt;radian.dc@gmail.com&gt;</a>
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
I have questions about this patch's origins, given the above s-o-b's.
Signed-off-by's state an authorship or handling (see Developer’s
Certificate of Origin).  Since I have not seen this patch, I should
not be listed.  It's on me to add my s-o-b.  Also, the ordering tends
to matter, as each person handling the patch adds their s-o-b at the
end of the patch.  So, you should be second, since you are taking this
from Javier and submitting it for him (nd I would be last since
I'mtaking it from you).

Also, this feels like it needs a "Fixes:" line.  So, I know how far to
pull this back in the stable branches.

Finally, I find it weird that Javier isn't submitting this himself.
Javier appears to be the author, and it includes his Linaro emaila
ddress, and you are sending it from a gmail account.  Are you
co-authors?  Are you sending it with his approval because he is
busy/vacationing/ill?

Overall the patch is fine and I would normally include it, but this is
weird to me.  If Javier acks it to confirm his authoer, then I'll move
my s-o-b to the end and include it.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Oh, this is a surprise.

Jon has a good point.

I have not approved sending this patch on my behalf. Yes, it looks like I am the original author because I recall fixing some issues around ccache a time ago; maybe last year if I remember correctly. But, before I acked it, I would like to know from where it was taken to have a bit more context. URL? Was the patch accepted or rejected?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I think I know what might've happened.  It's already in the tree
(commit f2efb2a45610216cb6c2d72bdb5d5e61b990064a).
I'm guessing that Adrian accidentally sent it to this list while
trying to backport it to an older release.  I got overly concerned
with the s-o-b lines and didn't think to check what it wasn't applying
:)

Anyway, I think we can disregard this.

Thanks,
Jon

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">  &gt;
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Jon


</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">---
  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc     | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 2e3b50c5..5d3da59b 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -101,9 +101,9 @@ def remove_options_tail (in_string):
      from itertools import takewhile
      return ' '.join(takewhile(lambda x: not x.startswith('-'), in_string.split(' ')))

-EXTRA_OEMAKE += <a class="moz-txt-link-rfc2396E" href="mailto:LD=${@remove_options_tail(d.getVar('LD'))}">"LD=${@remove_options_tail(d.getVar('LD'))}"</a>
+EXTRA_OEMAKE += <a class="moz-txt-link-rfc2396E" href="mailto:LD='${@remove_options_tail(d.getVar('LD'))}'">"LD='${@remove_options_tail(d.getVar('LD'))}'"</a>

-EXTRA_OEMAKE += <a class="moz-txt-link-rfc2396E" href="mailto:CC=${@remove_options_tail(d.getVar('CC'))}">"CC=${@remove_options_tail(d.getVar('CC'))}"</a>
+EXTRA_OEMAKE += <a class="moz-txt-link-rfc2396E" href="mailto:CC='${@remove_options_tail(d.getVar('CC'))}'">"CC='${@remove_options_tail(d.getVar('CC'))}'"</a>

  # Verbose builds, no -Werror
  EXTRA_OEMAKE += "V=1 E=0"
--
2.43.0


</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Thanks,

» Javier Tia 🖋
</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------KkGP6mIxhZW1XWSbM5rr007a--

