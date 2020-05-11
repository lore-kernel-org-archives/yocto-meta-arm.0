Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web11.13485.1589208473336977311
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 May 2020 07:47:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ihrosK8b;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id j8so9909094iog.13
        for <meta-arm@lists.yoctoproject.org>; Mon, 11 May 2020 07:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=wknbnmXs5eLnbwqq7czYZR5jZ2ulnLlE7yiXnjhxChw=;
        b=ihrosK8bgofkASQbrNpOjetJi6MTjwW5Svp4RS7O36lPCU4zoTHhTnpWKh1gDnwpd5
         OXqWr9KS9sf1qRhbwjJzLg/RJrKvnmCl6drHvmEjbs2wuqjceFPKsvwiXeji9w4J4YBJ
         56CG28F8EyapyjnK2vij+GMla+bGdfcJ0YJ208LOQdcOZNdSxAr4dLwQGZCC0CD7GVTB
         NlP8MN/WRxl6bPh4JqBFMb2fOelMwZOi633+OIJOT5FsVJZEaXJ70nPuDoZKFhm/SU6m
         LyFOVbb+foyvSUvMQw8XVBgozyTDukT4q5TXB+m1YiYvfH5sYJXtRxUXzdj4sccP59Rz
         Q8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=wknbnmXs5eLnbwqq7czYZR5jZ2ulnLlE7yiXnjhxChw=;
        b=CW4y2G2/B2lU9HHdjDyIywapWE7Hjgdz0etHjYBok3OCoMn/XlwWMEE7lXfsZBAKum
         5vgW2AjB+I8lM7v2gO7y1ynhE3/hSvUgo9MjBd2VuAHBZpZcjA+wUaMVCdihX22x9DEM
         Bz+KEXIH+vuwkPpLwrp0lq5qug6h5WzUv0cN5wJdfEX9OF5l0c1WOOZcTdraSoIsO7KO
         fayh5EFQKQKBID61e8xa+IQoOhlEiYuqL3lPJcypynq+udi7bEtrZBpTcAl2XxSPA5RX
         gJvC8KQr/6GY6Me5PM2zI38i/SXwdo+SP6q0OPKs8frPseI+X3pnP0rYkXJ6P86kCI69
         T6MA==
X-Gm-Message-State: AGi0PuZxi6KbLh37+xYqJ6jf6HaZjAu3LGatcGDLP9ix7u3jZt0NMPry
	HzM2B3ei1SSr4fAfAwlkKdCFGE1n
X-Google-Smtp-Source: APiQypL97/AngYzyYz52P4wTZroB5CAVJD9uOd0kS5NuAlKWLuMqVaFBsxFjrIPg/utFHngmGq+6fA==
X-Received: by 2002:a5e:c318:: with SMTP id a24mr15435286iok.166.1589208472449;
        Mon, 11 May 2020 07:47:52 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:ac13:ea07:8c16:df2d? ([2605:a601:ac3d:c100:ac13:ea07:8c16:df2d])
        by smtp.gmail.com with ESMTPSA id z9sm4236159iln.13.2020.05.11.07.47.49
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2020 07:47:49 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-arm@lists.yoctoproject.org
Subject: Sharing TF-A with multiple BSP
Message-ID: <2fb20adc-6d54-fefc-dfe7-007ee02fc01d@gmail.com>
Date: Mon, 11 May 2020 09:47:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Continuing the outcome from a discussion that was on the OE-core mailing 
list, I've started converting some of the BSP layers I work on to use 
the trusted-firmware-a recipe from meta-arm as the canonical source of 
ATF instead of each of the implementing their own recipe. So far this 
has gone well except for one annoyance I've found: meta-arm has a layer 
dependency on meta-python, specifically for the optee recipe. Normally, 
this wouldn't be such a big deal, but in a ideal world there will now be 
a lot of BSP layers that depend on meta-arm to provide ATF, and it seems 
annoying to have to make all of those layers (transitively) depend on 
meta-python.

I can think of a few possible options:

1) Do nothing because no one other than me thinks this is a problem :)

2) Use BBFILES_DYNAMIC to make optee optional based on the presence of 
meta-python

3) Use PACKAGECONFIG to remove the python parts of optee (if that's even 
possible). They can be automatically added back if meta-python is 
present via BBFILES_DYNAMIC.

4) Remove the hard requirement of meta-python from meta-arm; it's only 
needed to build optee so the users can figure it out?


Anyone else have any ideas or thoughts?

Thanks,
Joshua Watt

