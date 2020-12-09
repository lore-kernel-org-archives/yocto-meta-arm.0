Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web08.8992.1607529703388992468
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Dec 2020 08:01:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=g5iA9ZEJ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id h19so1235934qtq.13
        for <meta-arm@lists.yoctoproject.org>; Wed, 09 Dec 2020 08:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=sz++KDE1UxGkoaRnabxyrBr0BpEueTRlaOaxDjb4qRg=;
        b=g5iA9ZEJP1QAoiYRXvJsXfaWMbSDdM2SoDck6WL4xo8pJQlth0dDHttQB9Baf1owh8
         a+FmHobRgqsdoQlKFZgOHeKWhXVOaWImdWQusOH6ZfG35skZoa1RIx/6y66DXKwDb+XL
         zc6bzOPdaTunpn1fqPY8pGz23twF6cRkr1v8yUi47vK7DhhMfTG/2TOfH9a7EFvPF2yj
         iSQp/muKWkb/UoXjTvlk+S9zhZbBbnNdrSORg5h58W6A2C4y8WWuHFG70ssdlwGLfLtM
         xERDKpQmmyJI6RfsASp1eQI8VKrQ0Jhfbq/s9bagWALwfpzaziMyPTwJh+2YffRmjo3U
         bN7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=sz++KDE1UxGkoaRnabxyrBr0BpEueTRlaOaxDjb4qRg=;
        b=W5omrXKMRpPxi8ao0PnJeOraCzvn5MAiF9GEGuI0bauCmMBinMLoIeuUwmNoSJaKbR
         SLACeqxIoRSmEa0jeLV31UJ7NebwtgcTulEs8F5M8E57GH/PJqLuogMyLgXAZGErOIZ7
         SRWkxE1CfseuM10NVe1B3mR2S+WOOlgdrM0qIfOBBPE0o9geOabDSvppaqPpGF0CTyVQ
         Seuv0ri2hXTh4oyEEXvjQVTNQ91aWu9kv86VORoFEAd1s02uXsfjfmopTL5B4gu/3pRv
         4R8MUtz2FWS8FZb/PO/LDmsEQO+uEqVmUDtMYZjPcw10IwFzyLnjthP6+qPwvoxv7AJe
         nKRQ==
X-Gm-Message-State: AOAM533X6hXThhCRjFkax5QIeNAFAUqWdXNdqHaocJUhcTT53aI4gRa3
	PUj8wYsp8BDdejfzFeceMj16Hw==
X-Google-Smtp-Source: ABdhPJw//wei0LEK/QrqzYtTKNgdFBGE0hDH73/T9MhHjVM+jRIqwZiI2vJck0BuU0SC4KBfNsooZg==
X-Received: by 2002:ac8:59d5:: with SMTP id f21mr3831705qtf.2.1607529702537;
        Wed, 09 Dec 2020 08:01:42 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a606:1b00:a12d:9189:5829:3da3])
        by smtp.gmail.com with ESMTPSA id 9sm1358718qkm.81.2020.12.09.08.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 08:01:42 -0800 (PST)
Date: Wed, 9 Dec 2020 11:01:40 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>, Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org
Subject: meta-arm-toolchain updates and removal of legacy versions
Message-ID: <20201209160139.GF12460@kudzu.us>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Sumit and Denys,
We are in the process of updating recipes for the meta-arm hardknott
release.  The intention of doing so early is to give everything
sufficient time to soak and test (and downstream users time to complain
if we break them).  To this end, I see that there are updated versions
of the external toolchains, and I wanted to know:

1.  Is anyone currently working on updating the recipes to the very
recently released version
(https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads)?

2.  Are there any plans to remove the versions that are no longer
in-use/supported?


Everyone else,
Related to #2, what versions are people using that they would like us
to keep (or add if not currently present in meta-arm-toolchain)?

I don't want to break anyone or remove useful functionality, but I do
have concerns that there could be uncorrected GCC CVEs present in
older toolchains, and by continuing to make them available, we are
enabling this exposure.

Thanks,
Jon
