Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1215DC433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 13:31:58 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.9229.1648042317343903325
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 06:31:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=fP6tq1ND;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.178,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f178.google.com with SMTP id 1so1015973qke.1
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 06:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=646dFmsTqU79NweW6AO0eggOLuP/qMlzvjVXzyyrvTE=;
        b=fP6tq1NDku0cFTsxb3WDiC5fPCxrE0CFchTFrGv12DDVRaHPBVVRZikHqUBMy78H9B
         kuZQ7LYFpotuBaOxz7bPaaybIbm2i4XAqWh3/+/uiHdlEsqUU/0keU4UozIfPF9egiYJ
         IrjbqER+7vLAC4dc2W1m4JkBDi5JE25NtLE7504UkEby2xcBjmrjXm3gAVcKFtW3Z7nA
         6e/wlTr1U4Qwj1ncklrALSCK3hhT/B6goxVT6l2IjhZlq28ec9/mYB6CqyZGVG6+n06C
         xVb6B1RnI10kKpA02FFQ7RwVxGTnXAR120GPI1vEFr0r3X1uiX27V7ZL1TcDgsOMVqrL
         Lbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=646dFmsTqU79NweW6AO0eggOLuP/qMlzvjVXzyyrvTE=;
        b=tAXin9VVVo1X6838Z8HbNX+QfHkbOyO+vefINKexYoK4Q1gq/vhsCRp+iN+Daq8/iX
         CwQbelLnLm7/o2ZmkgCrnbLVZm4TGOLfT5CTZQCbD0yKghvpCbQe4eix/usful6qse0E
         kmDCn1e2IaVsVYxEz/iEMBA/NtQ+Grv3Ru7mkfoi06gUMafc0kPsSydL/mSywMq2b3IN
         6GojqBnKwJfCvc8DU7WpAUw97CD/HWcBwn/prePpwls6Xd90PPThC5Rbi8B5QRo7ryj1
         KJNPDDgYY68ZcOLDK9H3pQSBxplxaZW/mcn6M4xUFKzdfdju1YZOjXfVIwwBJPHN1+WM
         JdkA==
X-Gm-Message-State: AOAM533tWhNTfO6WeoUEIy/hCDbkroNzxSbMMiTXnsODXN54qNTx0jAD
	xrAGcFW1B8S7CHOhYcHLexxugz2CAm2JSw==
X-Google-Smtp-Source: 
 ABdhPJyzMtkGZi2pCl/HvDPw1ipBQ1KXZmQIh2sIGQGLKJKv8G6mgKvZOzciIFHHchhxDAg3L0wtLg==
X-Received: by 2002:ae9:eb4a:0:b0:67b:2de5:f3eb with SMTP id
 b71-20020ae9eb4a000000b0067b2de5f3ebmr17668319qkg.160.1648042316269;
        Wed, 23 Mar 2022 06:31:56 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 w8-20020ac87e88000000b002e1cdc11203sm42676qtj.18.2022.03.23.06.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 06:31:55 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
Subject: Re: [PATCH] arm/optee: Upgrade from 3.14 to 3.16
Date: Wed, 23 Mar 2022 09:31:16 -0400
Message-Id: <164804228334.3978431.6239604183028661353.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220226030441.2301940-1-alhe@linux.microsoft.com>
References: <20220226030441.2301940-1-alhe@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 23 Mar 2022 13:31:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3198

On Fri, 25 Feb 2022 20:04:41 -0700, Alejandro Enedino Hernandez Samaniego wrote:
> - Removes upstreamed patches for optee-examples
> - Fixes optee-examples installation
> - Includes new python3-cryptography dependency
> - Fixes python3-cryptography to work with openssl
> 
> Tested on qemuarm64-secureboot via optee-examples xtest -l 15

Applied, thanks!

[1/1] arm/optee: Upgrade from 3.14 to 3.16
      commit: 3d0e5368d17fac053227422e4f4fddbc1fa7c7de

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

