Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
 by mx.groups.io with SMTP id smtpd.web10.37131.1590766323898427351
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 May 2020 08:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=F1N6OPvg;
 spf=pass (domain: gmail.com, ip: 209.85.166.195, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f195.google.com with SMTP id a14so2912010ilk.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 29 May 2020 08:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=JQ1hhjUL4LqWPZRDOCSqQMCXT1pusMg5XR+DUanRJAg=;
        b=F1N6OPvgbpXITwvxdk/7JzBy59c6FekqVlJtmJMFwKejs5Nu78HRMxU4d/fHNwuvM+
         cNbNrHa0WRh0lMcYeO5qNs8skz8R889snQEiKyad+GN4DvTYJTmzfoORhO3mUfKMnGv8
         CqFcxhsfzKWLyqtBHilepaq2tAwg3pl6TDfNBISf2UDuWd3xB4dNjEJsVvcKd4rf5M9K
         z7R9qwGtO2kUamWauZjUMWgprQNB8umC9BlyIH90mitUkglmOz0g7CIY5L656wg/uMq5
         j0uPYC+0L4DrNAsfgat9gSlWThPdoJ6PkX84HrMGjsxnQocqdt8W3TkRloZssuVMlfBI
         dc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=JQ1hhjUL4LqWPZRDOCSqQMCXT1pusMg5XR+DUanRJAg=;
        b=sy8x24qq0CYLs8XSPlgbUxhAY14SKI6IflgPpf+wu3HjqAW1xCFZ2Rxsi1J2RZ5k98
         /1BKeRMnzioyD+McZX5qJCsGrW+zZAf2LREUcqGsZXe7D8+YmP5o4N6A/et4iS6yONhl
         jg7gkuky5W4o9q4ENRYiVkqhws2UwXH81EqXgkFPqzEht7g/xv8jKhTGlhEiqDG2s7+I
         kNAcjI6gmA9QMOSTCoLBN+vT3OUkL8tPvpozs/rlzlTS/xqo1qDEs/TGZdDL7RoKLgsg
         H274LeL83IZcXUyESGEgMycgEU9NelXu5hzCtWsMijOCgrbnJWCjbhMH/OzAtNNoXoss
         3H6g==
X-Gm-Message-State: AOAM530nq2ziPPQKAJgQJaTxgOEhYla0Uy1PNTGiKb6T/2GKHxlOcUpm
	Ew6cTTocPRq0WnwjN2XI/zI=
X-Google-Smtp-Source: ABdhPJwalRCra5wiWpvZ2af5YRxEwTbOBQn/0AOdUWVG2vilhzmLXOI8OqsDmFAomD8+VdZrnpzn3Q==
X-Received: by 2002:a92:ba05:: with SMTP id o5mr8196928ili.263.1590766323300;
        Fri, 29 May 2020 08:32:03 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:2495:669d:5b93:9222? ([2605:a601:ac3d:c100:2495:669d:5b93:9222])
        by smtp.gmail.com with ESMTPSA id j9sm4914727ilr.18.2020.05.29.08.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2020 08:32:02 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [meta-arm][PATCH] meta-arm: Remove meta-python dependency
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
 nd <nd@arm.com>
References: <20200529151427.20272-1-JPEWhacker@gmail.com>
 <90DD68A5-0834-4C82-8A06-BC3972756CA3@arm.com>
Message-ID: <6d6ccf5c-f134-1a15-e5eb-8f5e10d03832@gmail.com>
Date: Fri, 29 May 2020 10:32:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <90DD68A5-0834-4C82-8A06-BC3972756CA3@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/29/20 10:21 AM, Bertrand Marquis wrote:
>
>> On 29 May 2020, at 16:14, Joshua Watt via lists.yoctoproject.org <JPEWhacker=gmail.com@lists.yoctoproject.org> wrote:
>>
>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> ---
>> meta-arm/conf/layer.conf | 3 +--
>> 1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
>> index d96e9f1..1c241d4 100644
>> --- a/meta-arm/conf/layer.conf
>> +++ b/meta-arm/conf/layer.conf
>> @@ -11,6 +11,5 @@ BBFILE_PRIORITY_meta-arm = "6"
>>
>> LAYERDEPENDS_meta-arm = " \
>>      core \
>> -    meta-python \
>> "
>> -LAYERSERIES_COMPAT_meta-arm = "warrior zeus dunfell"
>> +LAYERSERIES_COMPAT_meta-arm = "gatesgarth"
> Could you explain why you want to remove dunfell compatibility ?

dunfell doesn't have the required python recipes in oe-core, so it isn't 
compatible with it anymore.


>
> Bertrand
>
>> -- 
>> 2.17.1
>>
>> 
