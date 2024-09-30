Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 292BFCEB2CC
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 22:47:25 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web10.68404.1727736438813209976
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 30 Sep 2024 15:47:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=I9camMms;
 spf=pass (domain: linaro.org, ip: 209.85.222.42, mailfrom: javier.tia@linaro.org)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-84e85d2b5baso1330933241.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 30 Sep 2024 15:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727736438; x=1728341238; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5cNNW7Zka73hiVAMikt+XHzwoIQ8uQd6Jxjh1Mz13wI=;
        b=I9camMmsJLfKFM2b+DtvSuEY06I43va2Fl+ydIYDY3hDwbVFRv2LXxqD2alNPMt7yj
         xEcUmVobjzY7SLfat8K0I8vwbUZ7izm4h7Tikuey2DyHUmMravIFmifT42IPZSIUeATw
         sZ41ozoouXB4xsbSamFlcz6q62EpmPl0d1vGPAapcA//gBwf6gh1jgDz7JzYekWh+89u
         sensPXBhwTScR1t+eyQsssGvG5MbC/DAu4kL8WvnHquP0cEXlQSFn0Vu5utmzBZ4Grf9
         gqjVIFTlS1MtuL/stp4IU8WC07MIiZIpkjm60z8nUkTDWgwiclWA/0XgTzpvVlVanz+X
         yLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727736438; x=1728341238;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5cNNW7Zka73hiVAMikt+XHzwoIQ8uQd6Jxjh1Mz13wI=;
        b=BVxNPrsdiUg1lz9ZHlDdHqOAgmmCQSvsEpALRm1UiQxnLNN13TaI6vhWP0UqZnoYx2
         /kK+FV2PYIXf9zP+CFQENHceQY/d8/8d4BEOinSRq0lVj85zV3B6HQtJuRRMe8JD+lZ9
         eoDHGB++mZGtB8XY6zI0D9UR2uSgRsgFVTy6KLLTXD27DQDAQGr8vK2ku2JJKYZgeTHT
         lWM1bOthd+dSh3Jj9x6R1aOvuK99LMDY/0PrAn9jzNMmOrVa0smO+x+ehbtShEbIxaNQ
         nLTCpr/LMB5yX9itCEmiF/iyn8NIMGxHEYJTzkEpuKRY7TsxIY4159iOe3yBNe1Kki8k
         cErQ==
X-Gm-Message-State: AOJu0Yxgrkpj6PoFDP1CUWMQPeEMmTHHWJ058VY6VGo4trqZy3B7fXUk
	rgOR2+xOJXxNER23Um5Q/knL4YxS4FVpTWRNtf6XTTi8cCdYopuF8AL5YU0YYMY=
X-Google-Smtp-Source: AGHT+IGAgkEoSsOHOqpwi7awnkEDq9mBd32WzS/4tmG/0l0uJKPeolT1KSfgLVda7x1NGrCFjIQtKA==
X-Received: by 2002:a05:6102:3909:b0:4a3:c48a:6d with SMTP id ada2fe7eead31-4a3c48a072amr3914767137.7.1727736437653;
        Mon, 30 Sep 2024 15:47:17 -0700 (PDT)
Received: from [192.168.8.164] ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4a3bbce5c7dsm566206137.34.2024.09.30.15.47.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 15:47:17 -0700 (PDT)
Message-ID: <7afc0d4f-cf91-4750-93a3-3fc9c9a1b364@linaro.org>
Date: Mon, 30 Sep 2024 16:47:15 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] trusted-firmware-a: fix build error when using ccache
To: Jon Mason <jdmason@kudzu.us>, Adrian DC <radian.dc@gmail.com>
Cc: meta-arm@lists.yoctoproject.org, Jon Mason <jon.mason@arm.com>
References: <20240928155436.1145975-1-radian.dc@gmail.com>
 <ZvqvFhYoRXQ9RQ4H@kudzu.us>
From: Javier Tia <javier.tia@linaro.org>
Content-Language: en-US, es-MX
Autocrypt: addr=javier.tia@linaro.org; keydata=
 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
 WdJQjTu3/NJR54YogRY=
In-Reply-To: <ZvqvFhYoRXQ9RQ4H@kudzu.us>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 30 Sep 2024 22:47:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6150

Hi,

On 9/30/24 8:00 AM, Jon Mason wrote:
> On Sat, Sep 28, 2024 at 05:54:36PM +0200, Adrian DC wrote:
>> From: Javier Tia <javier.tia@linaro.org>
>>
>> When ccache is enabled trusted-firmware-a recipe fails with this
>> error message:
>>
>>      make: *** No rule to make target 'aarch64-poky-linux-gcc'. Stop.
>>
>> ccache prefix CC variable with 'ccache' word before compiler. Because
>> there are no quotes assigned to CC, only 'ccache' is assigned. The
>> compiler becomes a make target, producing the build error.
>>
>> Add single quotes to LD is a good measure to prevent this kind of error.
>>
>> Signed-off-by: Javier Tia <javier.tia@linaro.org>
>> Signed-off-by: Jon Mason <jon.mason@arm.com>
>> Signed-off-by: Adrian DC <radian.dc@gmail.com>
> 
> I have questions about this patch's origins, given the above s-o-b's.
> Signed-off-by's state an authorship or handling (see Developer’s
> Certificate of Origin).  Since I have not seen this patch, I should
> not be listed.  It's on me to add my s-o-b.  Also, the ordering tends
> to matter, as each person handling the patch adds their s-o-b at the
> end of the patch.  So, you should be second, since you are taking this
> from Javier and submitting it for him (nd I would be last since
> I'mtaking it from you).
> 
> Also, this feels like it needs a "Fixes:" line.  So, I know how far to
> pull this back in the stable branches.
> 
> Finally, I find it weird that Javier isn't submitting this himself.
> Javier appears to be the author, and it includes his Linaro emaila
> ddress, and you are sending it from a gmail account.  Are you
> co-authors?  Are you sending it with his approval because he is
> busy/vacationing/ill?
> 
> Overall the patch is fine and I would normally include it, but this is
> weird to me.  If Javier acks it to confirm his authoer, then I'll move
> my s-o-b to the end and include it.

Oh, this is a surprise.

Jon has a good point.

I have not approved sending this patch on my behalf. Yes, it looks like I am the original author because I recall fixing some issues around ccache a time ago; maybe last year if I remember correctly. But, before I acked it, I would like to know from where it was taken to have a bit more context. URL? Was the patch accepted or rejected?
  > 
> Jon
> 
> 
>> ---
>>   .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc     | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
>> index 2e3b50c5..5d3da59b 100644
>> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
>> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
>> @@ -101,9 +101,9 @@ def remove_options_tail (in_string):
>>       from itertools import takewhile
>>       return ' '.join(takewhile(lambda x: not x.startswith('-'), in_string.split(' ')))
>>   
>> -EXTRA_OEMAKE += "LD=${@remove_options_tail(d.getVar('LD'))}"
>> +EXTRA_OEMAKE += "LD='${@remove_options_tail(d.getVar('LD'))}'"
>>   
>> -EXTRA_OEMAKE += "CC=${@remove_options_tail(d.getVar('CC'))}"
>> +EXTRA_OEMAKE += "CC='${@remove_options_tail(d.getVar('CC'))}'"
>>   
>>   # Verbose builds, no -Werror
>>   EXTRA_OEMAKE += "V=1 E=0"
>> -- 
>> 2.43.0
>>
>>

Thanks,

» Javier Tia 🖋

