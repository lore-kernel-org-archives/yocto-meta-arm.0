Return-Path: <radian.dc@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD771CFB424
	for <webhook@archiver.kernel.org>; Sun,  6 Oct 2024 10:07:54 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.28672.1728209265459620780
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 06 Oct 2024 03:07:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tg5mJYKn;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: radian.dc@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42cc43454d5so26142605e9.3
        for <meta-arm@lists.yoctoproject.org>; Sun, 06 Oct 2024 03:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728209263; x=1728814063; darn=lists.yoctoproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+SEbqpMSifNUrn+dyQwtbjU4M3mmrjL3uYOT2wSO84=;
        b=Tg5mJYKntaxKvSoLwVO5EQQ9VQNURpdYzia8pprAD41CjNruit402H9w3dPcZJ4b9/
         GvWHN8KgcmiD71ig/sgqEAZe+OUih/ebAfUbOFIgaLkFU1OTMDo7rRT9eVwBt5dtYjzH
         UDR2D7jnig8j4Ku07pHU0nN1fQQwtIYSjVcIhAxOqk1kAu+1i5TYMV0vbwexwE+KURJJ
         v8/yZkL5np/hpmjQ2fcq+at2pgnkcSd3zhc9jNvoIlLpXbwEAEbPLXfys2LgeFptoNyf
         q0vvCtXobjP8l441V6faMxDOWZHo1V2Ayc1f0OKb5v+YLii4Mujccehf1shUoYYVGLIn
         l/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728209263; x=1728814063;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m+SEbqpMSifNUrn+dyQwtbjU4M3mmrjL3uYOT2wSO84=;
        b=RqN+n+IZJjjA8yC1gttwIo/E2Uny42sUQV4okbXq4V3kSNU5WZ4LJqR/yGNjx5GyV2
         nx1Mr5xiV3MKw/1BP1DVVBkB5hBfEAVFuP+Dq/755xLIYovs4DN01avofcgOMI9QvUqh
         tsddZHeBz3LxgOGQCS8AigJwNZ1UBAyjkCpnTs/qg3KGzi24Knlu4kr1ht8de25TNaQS
         SnjptP0VM7DEPyRC47C8drNbHVkKMn3ITG9cePRScIO9vwtacV7o+yvdsHmv+G0eHWsT
         fbURicfxR8+P20xTH/JSgoy48jVAaEgMCjTThy9TUVcgv/6xwJRGtJHLhpnzg4mVHxhN
         KZHw==
X-Forwarded-Encrypted: i=1; AJvYcCVyOUNBdcLFNE4My814W40YaCBINPTsWDy69U6gmunnT97KutnMc3RJULeFlJsWg3f/ZYZIUcV6bg==@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzgIZwZ4f7sL2TywBERvM9nKspiP97WYwWa20SXFt6cGMVnNsaN
	9m2E4QUhIsqY5jbldH+AIeyp1CJ+Tf2unUEhrLbx35BblOu3/efA
X-Google-Smtp-Source: AGHT+IEXcTNEpsu3J/QsR2tRRjbIY8iBQ6g/VV00N2/Lqmo550+60OOuZ//5QHPlbMOPxZdy0U+bgA==
X-Received: by 2002:a5d:404c:0:b0:374:c8dd:ea47 with SMTP id ffacd0b85a97d-37d0eb0b38fmr4340463f8f.50.1728209263127;
        Sun, 06 Oct 2024 03:07:43 -0700 (PDT)
Received: from [192.168.1.60] (176-136-226-28.abo.bbox.fr. [176.136.226.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f89e8af91sm42827765e9.19.2024.10.06.03.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Oct 2024 03:07:42 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------VBhTIuFO3fHFnF5xVKvDJwb9"
Message-ID: <a55df2fa-1cc8-41d1-b91b-0061f415adf8@gmail.com>
Date: Sun, 6 Oct 2024 12:07:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] trusted-firmware-a: fix build error when using ccache
To: Jon Mason <jdmason@kudzu.us>, Adrian DC <radian.dc@gmail.com>
Cc: Javier Tia <javier.tia@linaro.org>, meta-arm@lists.yoctoproject.org,
 Jon Mason <jon.mason@arm.com>
References: <20240928155436.1145975-1-radian.dc@gmail.com>
 <ZvqvFhYoRXQ9RQ4H@kudzu.us> <7afc0d4f-cf91-4750-93a3-3fc9c9a1b364@linaro.org>
 <CAPoiz9xr1DyEP-XWCRK_uhShDbb0kRrfcw8V8PL_CGwcCAP2PA@mail.gmail.com>
 <c5d876bf-2c3e-4fe2-8ebb-92dec0a0a3f5@gmail.com>
 <CAPoiz9wVJSHMz_5NaUz3ZrGdO9yYX95iKURsSob=7dVL2KcpQg@mail.gmail.com>
Content-Language: en-GB
From: Adrian DC <radian.dc@gmail.com>
In-Reply-To: <CAPoiz9wVJSHMz_5NaUz3ZrGdO9yYX95iKURsSob=7dVL2KcpQg@mail.gmail.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 06 Oct 2024 10:07:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6175

This is a multi-part message in MIME format.
--------------VBhTIuFO3fHFnF5xVKvDJwb9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks for the feedback, and for the kirkstone backport approval 👍.

Regarding mickledore, no problem, LTS and active versions only is normal,
not using it (apart from some backports to kirkstone when needed), was 
just a note of relevant branches.

Noted for the [kirkstone] customized title to ease CI.

Thanks,
*Adrian DC*


On 02/10/2024 15:07, Jon Mason wrote:
> On Mon, Sep 30, 2024 at 9:56 PM Adrian DC<radian.dc@gmail.com>  wrote:
>> Hi,
>>
>> Sorry I wasn't available to respond earlier.
>>
>> Apparently the details I added after the initial send got lost.
>>
>> - Original commit : nanbield and scarthgap (f2efb2a45610216cb6c2d72bdb5d5e61b990064a as you pointed out)
>> - Missing on : kirkstone and mickledore
>> - Tested on : kirkstone with CCache enabled
>>
>> The cherry-pick was over kirkstone, without any changes except validation hence signoff (old Android System habits),
>> proposal was to apply the fix on kirkstone (being LTS and used by most SOM providers for now).
> No problem.  We only take patches for Yocto Project officially
> supported releases.  See
> https://wiki.yoctoproject.org/wiki/Releases
>
> The logic behind this decision is:
> 1.  We don't want to give the false impression that we support or test
> releases that are EOL'ed
> 2.  We don't want to encourage developers/users to use releases which
> are no longer getting security updates
> 3.  Some of them are currently broken and upstream will not take
> patches to fix this (broken download locations)
>
> So, I'll only backport this to kirkstone.  Throwing at CI now to
> verify it doesn't break anything.
>
> Per Denys's comment, if you put the release you want this applied to
> in the subject line, then I have scripts that automatically apply it
> and run CI on it.
>
> Thanks,
> Jon
>
>
>> Thanks for your concern,
>>
>> Adrian DC
>>
>>
>> On 01/10/2024 01:02, Jon Mason wrote:
>>
>> On Mon, Sep 30, 2024 at 6:47 PM Javier Tia<javier.tia@linaro.org>  wrote:
>>
>> Hi,
>>
>> On 9/30/24 8:00 AM, Jon Mason wrote:
>>
>> On Sat, Sep 28, 2024 at 05:54:36PM +0200, Adrian DC wrote:
>>
>> From: Javier Tia<javier.tia@linaro.org>
>>
>> When ccache is enabled trusted-firmware-a recipe fails with this
>> error message:
>>
>>       make: *** No rule to make target 'aarch64-poky-linux-gcc'. Stop.
>>
>> ccache prefix CC variable with 'ccache' word before compiler. Because
>> there are no quotes assigned to CC, only 'ccache' is assigned. The
>> compiler becomes a make target, producing the build error.
>>
>> Add single quotes to LD is a good measure to prevent this kind of error.
>>
>> Signed-off-by: Javier Tia<javier.tia@linaro.org>
>> Signed-off-by: Jon Mason<jon.mason@arm.com>
>> Signed-off-by: Adrian DC<radian.dc@gmail.com>
>>
>> I have questions about this patch's origins, given the above s-o-b's.
>> Signed-off-by's state an authorship or handling (see Developer’s
>> Certificate of Origin).  Since I have not seen this patch, I should
>> not be listed.  It's on me to add my s-o-b.  Also, the ordering tends
>> to matter, as each person handling the patch adds their s-o-b at the
>> end of the patch.  So, you should be second, since you are taking this
>> from Javier and submitting it for him (nd I would be last since
>> I'mtaking it from you).
>>
>> Also, this feels like it needs a "Fixes:" line.  So, I know how far to
>> pull this back in the stable branches.
>>
>> Finally, I find it weird that Javier isn't submitting this himself.
>> Javier appears to be the author, and it includes his Linaro emaila
>> ddress, and you are sending it from a gmail account.  Are you
>> co-authors?  Are you sending it with his approval because he is
>> busy/vacationing/ill?
>>
>> Overall the patch is fine and I would normally include it, but this is
>> weird to me.  If Javier acks it to confirm his authoer, then I'll move
>> my s-o-b to the end and include it.
>>
>> Oh, this is a surprise.
>>
>> Jon has a good point.
>>
>> I have not approved sending this patch on my behalf. Yes, it looks like I am the original author because I recall fixing some issues around ccache a time ago; maybe last year if I remember correctly. But, before I acked it, I would like to know from where it was taken to have a bit more context. URL? Was the patch accepted or rejected?
>>
>> I think I know what might've happened.  It's already in the tree
>> (commit f2efb2a45610216cb6c2d72bdb5d5e61b990064a).
>> I'm guessing that Adrian accidentally sent it to this list while
>> trying to backport it to an older release.  I got overly concerned
>> with the s-o-b lines and didn't think to check what it wasn't applying
>> :)
>>
>> Anyway, I think we can disregard this.
>>
>> Thanks,
>> Jon
>>
>>    >
>>
>> Jon
>>
>>
>> ---
>>    .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc     | 4 ++--
>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
>> index 2e3b50c5..5d3da59b 100644
>> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
>> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
>> @@ -101,9 +101,9 @@ def remove_options_tail (in_string):
>>        from itertools import takewhile
>>        return ' '.join(takewhile(lambda x: not x.startswith('-'), in_string.split(' ')))
>>
>> -EXTRA_OEMAKE +="LD=${@remove_options_tail(d.getVar('LD'))}"
>> +EXTRA_OEMAKE +="LD='${@remove_options_tail(d.getVar('LD'))}'"
>>
>> -EXTRA_OEMAKE +="CC=${@remove_options_tail(d.getVar('CC'))}"
>> +EXTRA_OEMAKE +="CC='${@remove_options_tail(d.getVar('CC'))}'"
>>
>>    # Verbose builds, no -Werror
>>    EXTRA_OEMAKE += "V=1 E=0"
>> --
>> 2.43.0
>>
>>
>> Thanks,
>>
>> » Javier Tia 🖋
>>
>>

--------------VBhTIuFO3fHFnF5xVKvDJwb9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Thanks for the feedback, and for the kirkstone backport approval 👍.<br>
    <br>
    Regarding mickledore, no problem, LTS and active versions only is
    normal,<br>
    not using it (apart from some backports to kirkstone when needed),
    was just a note of relevant branches.<br>
    <br>
    Noted for the [kirkstone] customized title to ease CI.<br>
    <br>
    Thanks,<br>
    <div class="moz-signature"><b>Adrian DC</b>
      <br>
      <br>
      <br>
    </div>
    <div class="moz-cite-prefix">On 02/10/2024 15:07, Jon Mason wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAPoiz9wVJSHMz_5NaUz3ZrGdO9yYX95iKURsSob=7dVL2KcpQg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Mon, Sep 30, 2024 at 9:56 PM Adrian DC <a class="moz-txt-link-rfc2396E" href="mailto:radian.dc@gmail.com">&lt;radian.dc@gmail.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Hi,

Sorry I wasn't available to respond earlier.

Apparently the details I added after the initial send got lost.

- Original commit : nanbield and scarthgap (f2efb2a45610216cb6c2d72bdb5d5e61b990064a as you pointed out)
- Missing on : kirkstone and mickledore
- Tested on : kirkstone with CCache enabled

The cherry-pick was over kirkstone, without any changes except validation hence signoff (old Android System habits),
proposal was to apply the fix on kirkstone (being LTS and used by most SOM providers for now).
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
No problem.  We only take patches for Yocto Project officially
supported releases.  See
<a class="moz-txt-link-freetext" href="https://wiki.yoctoproject.org/wiki/Releases">https://wiki.yoctoproject.org/wiki/Releases</a>

The logic behind this decision is:
1.  We don't want to give the false impression that we support or test
releases that are EOL'ed
2.  We don't want to encourage developers/users to use releases which
are no longer getting security updates
3.  Some of them are currently broken and upstream will not take
patches to fix this (broken download locations)

So, I'll only backport this to kirkstone.  Throwing at CI now to
verify it doesn't break anything.

Per Denys's comment, if you put the release you want this applied to
in the subject line, then I have scripts that automatically apply it
and run CI on it.

Thanks,
Jon


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Thanks for your concern,

Adrian DC


On 01/10/2024 01:02, Jon Mason wrote:

On Mon, Sep 30, 2024 at 6:47 PM Javier Tia <a class="moz-txt-link-rfc2396E" href="mailto:javier.tia@linaro.org">&lt;javier.tia@linaro.org&gt;</a> wrote:

Hi,

On 9/30/24 8:00 AM, Jon Mason wrote:

On Sat, Sep 28, 2024 at 05:54:36PM +0200, Adrian DC wrote:

From: Javier Tia <a class="moz-txt-link-rfc2396E" href="mailto:javier.tia@linaro.org">&lt;javier.tia@linaro.org&gt;</a>

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

Oh, this is a surprise.

Jon has a good point.

I have not approved sending this patch on my behalf. Yes, it looks like I am the original author because I recall fixing some issues around ccache a time ago; maybe last year if I remember correctly. But, before I acked it, I would like to know from where it was taken to have a bit more context. URL? Was the patch accepted or rejected?

I think I know what might've happened.  It's already in the tree
(commit f2efb2a45610216cb6c2d72bdb5d5e61b990064a).
I'm guessing that Adrian accidentally sent it to this list while
trying to backport it to an older release.  I got overly concerned
with the s-o-b lines and didn't think to check what it wasn't applying
:)

Anyway, I think we can disregard this.

Thanks,
Jon

  &gt;

Jon


---
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


Thanks,

» Javier Tia 🖋


</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------VBhTIuFO3fHFnF5xVKvDJwb9--

