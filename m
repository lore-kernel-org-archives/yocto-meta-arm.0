Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A17C5321D
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 01:43:28 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.4028.1724291000823653990
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Aug 2024 18:43:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=nv6/Q/BR;
 spf=pass (domain: linaro.org, ip: 209.85.128.172, mailfrom: javier.tia@linaro.org)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6c0e22218d0so4359407b3.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 21 Aug 2024 18:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724291000; x=1724895800; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QztYLxVa/r1jORAYjb7tlFC+PcBf5mmvPyMauG0BvGM=;
        b=nv6/Q/BRpygtvwaCCvP1MN6nH9oH+H3rH80tlVIE3KNMrokn5ex4Bp3y3XhbiuDUUU
         zHy35BdouwxC8ugwDoMBCelCsUPp93Czb5GgXTBG6terQfFWOb3cY2vZv5o3XHYlh2kH
         gK9J76w9UdvxSUrX4o9ofsK/UsTmNamtFREnEwhHICbT8CfOfEKz7X9b0Kqqg+uzydsG
         KHbvdgileD+sTbUMkR2N7GBUfEuVeuC9udd3zect1RPN6gFzz4ilBgM4B4Y5GNtADqCl
         l1URhne6OzLiVLhK3/nGFANCDtzxrc4SwOBpx+H4QlZTZtArKQX5mcKHtQhkXvrkuILo
         Foqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724291000; x=1724895800;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QztYLxVa/r1jORAYjb7tlFC+PcBf5mmvPyMauG0BvGM=;
        b=ME81SuJKQySDhbBkSgW73BmmKdOsIfn0rNOd64gspVesAaNsmPWqRlecM1giSbu2rz
         jiTkkxljBcipult12KeHPtEedOok13D03PuPl/apymqGkUtzVDmrcr2rO0WzijN1f/eE
         3utH88UURxppDNJdQOCDUo/BG2o4bA4eNaOwkq+CGERta2VCOM1p3wqvH1QfTR3lZSdj
         k31x/dqWSr9Ae5Jlk5OfelG+RXS9h988s5aqm/p/WVdAHn1ea8+DWLvMxRB0QeRBt+X4
         VLRN3O5xWHe1RgzeBSSQpJe+S4fqvxFAreIEWxQgh6IvoExlf+0KMqkVZMSU65H00Mhu
         W25g==
X-Gm-Message-State: AOJu0YxD5RgLJGaQ/nyaz6Aq/n+64zoelw3o7nARFznIhUkq7crNS+QA
	qCtRH4PszBQ2cE1xD8CRqg6QbAKdToHR61OBuXTM4NRzHYGdKm3pRUXYy+NgbkM=
X-Google-Smtp-Source: AGHT+IHkf2ODCKcRrEGPglgEdd0oWotK7/yt/Zd8eCGwrE9lmca7vAQ+7ASNNeF47qGKhENIj3wUXw==
X-Received: by 2002:a05:690c:3241:b0:64a:e7ec:f3d with SMTP id 00721157ae682-6c3d2db741dmr3169827b3.18.1724290999911;
        Wed, 21 Aug 2024 18:43:19 -0700 (PDT)
Received: from [192.168.8.164] ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39d3aa4b8sm720707b3.90.2024.08.21.18.43.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 18:43:19 -0700 (PDT)
Message-ID: <d0126f7b-3d9a-4e0b-916c-85c8883e56bf@linaro.org>
Date: Wed, 21 Aug 2024 19:43:18 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/14] qemuarm64-secureboot.yml: Set branch to
 scarthgap
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org, Mikko Rapeli <mikko.rapeli@linaro.org>,
 Ross Burton <Ross.Burton@arm.com>, Jon Mason <jon.mason@arm.com>
References: <20240819190429.2897888-1-javier.tia@linaro.org>
 <20240819190429.2897888-15-javier.tia@linaro.org> <ZsX7KYA4_1ITkk4V@kudzu.us>
Content-Language: en-US, es-MX
From: Javier Tia <javier.tia@linaro.org>
Autocrypt: addr=javier.tia@linaro.org; keydata=
 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
 WdJQjTu3/NJR54YogRY=
In-Reply-To: <ZsX7KYA4_1ITkk4V@kudzu.us>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Aug 2024 01:43:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5989

On 8/21/24 8:35 AM, Jon Mason wrote:
> On Mon, Aug 19, 2024 at 01:04:29PM -0600, Javier Tia wrote:
>> diff --git a/ci/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
>> index 02341934..cadbe874 100644
>> --- a/ci/qemuarm64-secureboot.yml
>> +++ b/ci/qemuarm64-secureboot.yml
>> @@ -1,5 +1,9 @@
>>   # yaml-language-server: $schema=https://raw.githubusercontent.com/siemens/kas/master/kas/schema-kas.json
>>   
>> +defaults:
>> + repos:
>> +    branch: scarthgap
> 
> Please don't do this.  If it's broken in edk2 then hold back the
> version for qemuarm64-secureboot in a bbappend.  And if this was the
> right thing to do (which it isn't), it needs a comment saying why it's
> being done here.  Lastly, this fails CI majorly (in every instance of
> qemuarm64-secureboot).  One example,
> https://gitlab.com/jonmason00/meta-arm/-/jobs/7627395767
> 

Sure, I have removed the last commit hard-coding the branch. It's using master by default and passing the tests. Sending patch series v3.

Thanks,

» Javier Tia 🖋

