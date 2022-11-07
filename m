Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA8FC433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 19:05:02 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web09.1914.1667847892509462839
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Nov 2022 11:05:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=PN3FHMDF;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id c15so7430963qtw.8
        for <meta-arm@lists.yoctoproject.org>; Mon, 07 Nov 2022 11:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7O/FTCABkDNIjxbg+DVZDhNoPgHRmh2c+JbjFdgTOos=;
        b=PN3FHMDFf6LkkJXg6aLfrzbc900daf3k7oD9AYMm9vpFTKGOxNr3Kkwp+KulA+JmXE
         4o65IMxqPJLiZeNkvvR0ygqjH4ATA3zagEOTc8tL1FAQJuP6G05op5QkQ3r5Xh1Yn30q
         QMZQto8td2AIa6mnZHdvkt438J2haL3yXVyyZBtasQsZ0xSDWTbMfFnR+2I52wwfuPjN
         JxfKuEsuVm4CShPhX+1HiF2yosVkFQiLAJToGcq4wklyl0aGMXdUXhC9Fy+Qw5TZBKjl
         Mb9wP11CrHnLxHy4ZE6/4vZbRXYEHjs8kS9LOSM1wYW96eACJUe+aMzVZoZ5/kSxwf0w
         kflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7O/FTCABkDNIjxbg+DVZDhNoPgHRmh2c+JbjFdgTOos=;
        b=prBFUt+05G1Jyxvpn2Lia2wIlo6cW58HBCUjUUaVqlUqGCBHj0EErbdCb6fCyLHf0D
         ZJI2vNOQgYh/jnC9gl747pDjMTC6lJYsk7YEd0HpsO8+cOHqVEP0k3x0kDLOXj5ILpPw
         YtoUlivL/6m2nm5oCUEzXhCpfQsf2MO/gGr5G7yqSVjgKoIwtrq5GlO6JvXvpENfMLjI
         OsqUrtPBAUPKro7FTPmaUlTyzQDGStCNjGxBKNrNPzcPIz4pYHYDxIq5lyCeL3MHa1Bd
         3bDZ4Lmlt8FS49gGeemJzYZsodH51vWQbn2+JNs5mZivkqcZ8emRCLcGg2TXqlnD0v7Y
         XG6Q==
X-Gm-Message-State: ACrzQf2vRBoWmUeRLweDMtI5utfT5w9j28EDhIi9XAwc8R2YjB4nZYtT
	B2KGOhIKPVLbblDURxFXkkiwWcDbs7JLoQ==
X-Google-Smtp-Source: AMsMyM5oI6wMO604kYHGOj8ye1SXh5e0pQsI8yOukn2dXaVZaCDP2HYz9vUvmGxpoxGK+aX5SRwYYw==
X-Received: by 2002:a05:622a:1c12:b0:3a5:26b9:d4b1 with SMTP id bq18-20020a05622a1c1200b003a526b9d4b1mr764618qtb.413.1667847900099;
        Mon, 07 Nov 2022 11:05:00 -0800 (PST)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id x17-20020a05620a449100b006fa31bf2f3dsm7720150qkp.47.2022.11.07.11.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 11:04:59 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH langdale 0/3] arm/trusted-services: checks before
Date: Mon,  7 Nov 2022 14:03:56 -0500
Message-Id: <166784783591.2324924.12071306418256166871.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107114453.48460-1-emekcan.aras@arm.com>
References: <20221107114453.48460-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 07 Nov 2022 19:05:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4115

On Mon, 7 Nov 2022 11:44:50 +0000, emekcan.aras@arm.com wrote:
> It fixes few issues regarding ts patch stage.
> 1- Adds check if there are patches to be applied on psa-api-tests.
> 2- Fixes psa-api-tests (crypto and attestation) for corstone1000.
> 3- Changes default configuration on tfm to accommodate changes
> in "2" for corstone
> 
> Rui Miguel Silva (3):
>   arm/trusted-services: check before applying patches
>   arm-bsp/trusted-services: psa test setup corstone1000
>   arm-bsp/trusted-firmware-m: adjust ps assets for corstone1000
> 
> [...]

Applied, thanks!

[1/3] arm/trusted-services: check before applying patches
      commit: 3651527f577ea24bbb1bdcb3ef0705235a0e536e
[2/3] arm-bsp/trusted-services: psa test setup corstone1000
      commit: 9e2de7dacc355fc3def8bf54cd2d14595037c438
[3/3] arm-bsp/trusted-firmware-m: adjust ps assets for corstone1000
      commit: 8d35c5b5396f80523e73c493c936f60c8242d00c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

