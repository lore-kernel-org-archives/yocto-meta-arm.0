Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA9ADC433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 18:58:40 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web12.30399.1639508319843390734
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 10:58:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=L4Pw9QMf;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.173,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f173.google.com with SMTP id t83so17701941qke.8
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 10:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0L/1oVHRdpcSGznvTuzJo9nDrpdg8zPps7yNz2IaxPc=;
        b=L4Pw9QMfcwtyaECtKi/vSs+z7q0nkmoLN1xDeAd8+9b7YzQdbY5p38HUylvslEoHYl
         3qrXwjhJrDk4v/DLSW3jgp3b4wvxKAZRsirpSurbwYN553S5GlvcptXFPyEgK+39DBln
         Nhj/G7P/B/VjlrmXz32Aa6EhMPQI4r+NAozJExGD5XqpsoPUd8/kOQZv5ST4WgGKKzao
         gC1hqYohvR50rdgfJ1+hiV0sZVtrRXdvBEqUiBgartJ3vHITISMJD4dUMjokjdcj/LT3
         XyigIXUcIROK1UEpTBu+YtJ95T/R63xyCFS6J1hysufPoHGY+ciuQGwRT4f0pVpK7Gw2
         X+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0L/1oVHRdpcSGznvTuzJo9nDrpdg8zPps7yNz2IaxPc=;
        b=YOHIWMVw6rN7tJMSr7JDojrTC4yohUShQdO4CMHIgD/QG5ctOqZbIyFj1gjVQz2r/q
         q/XxazLWDgNI1TzX4bbScKmdspCyAmf+QuWsafMoIfeEW0Nan1Vi75/+UJmNTQWOie7l
         xHk3mv5AAA8+sD2G2Oz1gpEUvJ2BmGFmqWH4JnTJnUVx5oy29pybpVsiMD7O/xHo1gjd
         zDKfASVDEGmHS2v42qRQRJJkqxN6Fmne180zPMGyc5/fAMrZy0GGD2WnCY5jw6mAb9Cj
         8vspBTExAEX3lCYtMcFm5zqKKkta+ozyS8UzpW2RMy1YygTFU7s3pyHMqSgt3cBwzyzU
         42Wg==
X-Gm-Message-State: AOAM533Qo5olug7Hnk6W8Bk+m7YjXfT5CAayrBlhTcGVDbCbTFAnmCp+
	3zkYQpcxx2c3v3VsFhAbnflL4kobaazuBnJl
X-Google-Smtp-Source: 
 ABdhPJxNz4noNQad359tE5Hytoll3ic8pKZ3qqOMdBfzsuTvBTFVk7WwfoXLdJodKwh88dHMA/0aZA==
X-Received: by 2002:a05:620a:131a:: with SMTP id
 o26mr5661648qkj.71.1639508318907;
        Tue, 14 Dec 2021 10:58:38 -0800 (PST)
Received: from localhost ([2605:a601:a628:a600:61d7:b140:9e46:6475])
        by smtp.gmail.com with ESMTPSA id
 y12sm437165qko.36.2021.12.14.10.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 10:58:38 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	abdellatif.elkhlifi@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH honister 0/2] backport "corstone1000: EFI u-boot fixes "
Date: Tue, 14 Dec 2021 13:58:28 -0500
Message-Id: <163950830962.29010.17646660809529924852.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211214111600.12435-1-abdellatif.elkhlifi@arm.com>
References: <20211214111600.12435-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Dec 2021 18:58:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2709

On Tue, 14 Dec 2021 11:15:58 +0000, abdellatif.elkhlifi@arm.com wrote:
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> 
> Backporting the patchset from master providing EFI fixes
> on u-boot
> 
> Gowtham Suresh Kumar (2):
>   arm-bsp/u-boot: corstone1000: Remove GetVariable() fix
>   arm-bsp/u-boot: corstone1000: Fix efi debug issue
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/u-boot: corstone1000: Remove GetVariable() fix
      commit: 5f7671d89755a02ff769371329957b8773c40ba3
[2/2] arm-bsp/u-boot: corstone1000: Fix efi debug issue
      commit: a5377f15694d46be234ce8d9f2ed1e6722d0db33

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

