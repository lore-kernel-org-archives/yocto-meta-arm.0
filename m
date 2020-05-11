Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.155.1589219078263310101
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 May 2020 10:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n8kDfqdI;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id z90so8662161qtd.10
        for <meta-arm@lists.yoctoproject.org>; Mon, 11 May 2020 10:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=FzOa/Z9RBvBR/JGFiZVRWTiqWL8uymSPqdfUmWLQRQw=;
        b=n8kDfqdIMvgKMvQHfRBSorBADhSwfpj/OUwmUceJtOLnChghu0utkcVR/FlPeYuVTS
         PWg43tVr9PSj5SmJeyE5ypqknFJzAyS146jYl4pEFbaOX8W83cnLKfcDprFIs7j1cLdO
         VvX87dQoYUCmhfvhfDT59/M9iEeJqzIiCmYHzMHeJFt8Hpd7H0vuoMpsHn4RUBKxGCr5
         SThbH98B7JH7WcVuZlk38qo9TAbfjlgXQhOu+ZTfKR2OGlIvDU2kL6IBRkmrOWbvC1Pu
         STq/CtVcOSPv2OJnVelqzR9wyhf0geBS4bx/uuFlkelO5j/pzvf9Bn3f0ZpL8RCJxZMN
         c1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FzOa/Z9RBvBR/JGFiZVRWTiqWL8uymSPqdfUmWLQRQw=;
        b=JWOO6MJhoDrE4g5Z50S0Ydk4uv+2WTZf8M5MNyaH131rzYeNuXXDtsDPq/0Tq6dfwa
         Xh18iKyCYdCP9Au+HczAlW7PwmM0aVZUeihdCWZnPrgJ+Yg/rEiFrLFuTdObzNoeStbM
         /8mldmLytg7SWkWz2f+N/u+t7EVEBQeRhde7gcqICJ7982+UuCQbpIQ3l4KYaUSd8uEe
         XohYv0y0iSfvK8YyJbe+Qx44oMilO7nhjtZ0UPw87vFMj6j1FOoIjXOFKN3s2BYekP6z
         R411+RbJRh1I93OMUanSgQRfWNbD5P9YGtgLYSnoV8IGjC19JYziCu03xRcibjjY8hF6
         0Kag==
X-Gm-Message-State: AGi0PubL+uyFVC3ZoMPml9NKMnhPl0L+yqZ5Am5BSZEcWZWex+OV+qOH
	6Hzs51YxNQPaA0eYs7c8TK0=
X-Google-Smtp-Source: APiQypIV/IF39diYat+RXpi0Tx/7B3fz4yDfgorqE2M+ZRGojvq49mxsovmg2MEjRWRz5UzXnwdw3A==
X-Received: by 2002:ac8:1a8a:: with SMTP id x10mr17432518qtj.154.1589219077299;
        Mon, 11 May 2020 10:44:37 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:590b:675e:d680:e04e? ([2601:646:9200:4e0:590b:675e:d680:e04e])
        by smtp.gmail.com with ESMTPSA id i4sm8551557qkh.66.2020.05.11.10.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2020 10:44:36 -0700 (PDT)
Subject: Re: [meta-arm] [PATCH 1/5] layer.conf: add meta-python to LAYERDEPENDS for optee components
To: Denys Dmytriyenko <denis@denix.org>, meta-arm@lists.yoctoproject.org,
 Joshua Watt <JPEWhacker@gmail.com>
References: <1601D50E043B4BBD.6346@lists.yoctoproject.org>
 <1601D572187EB9D1.6346@lists.yoctoproject.org>
 <20200511172802.GH11927@denix.org>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <b695808d-102c-d9c3-0c91-6526acba07e6@gmail.com>
Date: Mon, 11 May 2020 10:44:35 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200511172802.GH11927@denix.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 5/11/20 10:28 AM, Denys Dmytriyenko wrote:
> On Wed, Apr 01, 2020 at 07:20:26PM -0400, Denys Dmytriyenko wrote:
>> On Wed, Apr 01, 2020 at 07:13:02PM -0400, Denys Dmytriyenko wrote:
>>> From: Denys Dmytriyenko <denys@ti.com>
>>>
>>> optee components use pycrypto, pycryptodomex and pyelftools from meta-python layer
>>

indeed unfortunate, some distros have actively avoided depending on 
meta-python and this derails that, can we somehow make these tools 
optional ? even if it is at a loss of features on OPTEE

>> And this is quite unfortunate! As a proposed common dependency for ARM-based
>> BSPs, I was hoping meta-arm could stay clean and only depend on OE-Core. While
>> meta-python by itself may not be such a big deal, it is not a standalone layer
>> and is part of a much larger meta-openembedded collection of layers. So, any
>> BSP that wants to depend on meta-arm would now need to pull meta-openembedded
>> in its entirety just to use meta-python...
> 
> +Joshua



> 
> 
>> -- 
>> Denys
>>
>>
>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>> ---
>>>   meta-arm/conf/layer.conf | 5 ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
>>> index 0b93e8d..d96e9f1 100644
>>> --- a/meta-arm/conf/layer.conf
>>> +++ b/meta-arm/conf/layer.conf
>>> @@ -9,5 +9,8 @@ BBFILE_COLLECTIONS += "meta-arm"
>>>   BBFILE_PATTERN_meta-arm = "^${LAYERDIR}/"
>>>   BBFILE_PRIORITY_meta-arm = "6"
>>>   
>>> -LAYERDEPENDS_meta-arm = "core"
>>> +LAYERDEPENDS_meta-arm = " \
>>> +    core \
>>> +    meta-python \
>>> +"
>>>   LAYERSERIES_COMPAT_meta-arm = "warrior zeus dunfell"
>>> -- 
>>> 2.7.4
>>>
>>
>>>
>>
> 
>> 
> 
