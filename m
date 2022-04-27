Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D61C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 23:48:31 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web09.3914.1651103310476432515
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 16:48:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=vcr76js2;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id hf18so2385552qtb.0
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 16:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/cGbGr1Iu+V3Ksgsc2zcPvxlOOSKuSEfGg1PdumUwqs=;
        b=vcr76js2NkHVtevZJpAzNKnOrY6T7GjR/zb00SYWFsJ1tjwt/9WdLvhY/5ZseM7Szh
         ujDHfQ/zVHPMc/bcX4WszInt+t8Ptu0EG/WsAwEp+/EPt5NQ7kCs3aLKc7U+oDH40sh0
         ZGrhpLVJkMdCIFDGDa/2TPTyuuFW1soBEO5KKTUc3AwbTUi+OziMW2qqGuDYJaYpvXDG
         gSB86d3M1Zn+8OgHaankpxaGBfNSPB3x0r6Va9AV0Op80zoQHpjIJa1Qd4nHDU9sg86m
         GZYGUK/GyY6n1QmmuTkAcNVkkkXHIbGXT5Hhx1np8OEEyttOS705cc7hpFb6HQRy1Unn
         nrBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/cGbGr1Iu+V3Ksgsc2zcPvxlOOSKuSEfGg1PdumUwqs=;
        b=t4WiEnTp3GrqPOaxgk4tcebgSO4wwx9EgRozMZ6//c9TRXBnQPghFwwiGE0vb49DZG
         5KkkDLJ1EDVcsh5UdQeltHHDtbRB2Pmqs/92yfU5HkFuS+Y9bDFZZFGnjmCl9QCay/6o
         R3xvH7XeJmkA3GOjDDejgi8ghHsH3P8xywV6F9xZLToVBrJImNB+yXmT0he7Zp6SeKDI
         phykUoIP9vkoUhgQLASfM3yp7Q6I69IX9PJH9l7kpl4XEcorTMvODZnTYIlO1tTAE94a
         dGyytpJmp0yTRMvlebtdeiSQAJGZ+PYSJqTNqQMQBdb10Fo/aYqX5KjDP8Hki3mimaRA
         xwew==
X-Gm-Message-State: AOAM5335RMdV9Yevejo/SI52NL/2lkhQmoUkxHWO5+PSm34gUNFP+hhJ
	df8hSCZhdQBRA2NBJvSuoHv5kNiq7+iu8A==
X-Google-Smtp-Source: 
 ABdhPJwSl6LvBaaP36buDKOsRnOmkGNPqbmZRq8zBSQ3yqxkFy5inrjzKUOCW08K/WrVi9eYG6511Q==
X-Received: by 2002:a05:622a:151:b0:2f1:fe9f:9177 with SMTP id
 v17-20020a05622a015100b002f1fe9f9177mr21297808qtw.628.1651103309501;
        Wed, 27 Apr 2022 16:48:29 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 v7-20020a379307000000b0069c0a2afc55sm9019443qkd.123.2022.04.27.16.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 16:48:28 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: Re: [PATCH honister 0/1] arm-bsp/trusted-firmware-a: corstone1000:
 update Tfa SHA
Date: Wed, 27 Apr 2022 19:48:19 -0400
Message-Id: <165110330059.2615102.1829500996359471844.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220425113112.52438-1-emekcan.aras@arm.com>
References: <20220425113112.52438-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 Apr 2022 23:48:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3314

On Mon, 25 Apr 2022 12:31:11 +0100, emekcan.aras@arm.com wrote:
> This commit updates Tfa SHA to remove the patches from the
> recipe since all of them are upstreamed now.
> 
> Emekcan Aras (1):
>   arm-bsp/trusted-firmware-a: corstone1000: update Tfa SHA
> 
>  .../conf/machine/include/corstone1000.inc     |   2 +-
>  .../0001-Rename-Diphda-to-corstone1000.patch  | 587 ------------------
>  ...e1000-made-changes-to-accommodate-3M.patch | 201 ------
>  ...plement-platform-specific-psci-reset.patch |  60 --
>  ...change-base-address-of-FIP-in-the-fl.patch |  33 -
>  ...identify-which-bank-to-load-fip-from.patch | 102 ---
>  .../trusted-firmware-a-corstone1000.inc       |  13 +-
>  7 files changed, 7 insertions(+), 991 deletions(-)
>  delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0001-Rename-Diphda-to-corstone1000.patch
>  delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0002-plat-arm-corstone1000-made-changes-to-accommodate-3M.patch
>  delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0003-corstone1000-implement-platform-specific-psci-reset.patch
>  delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0004-plat-arm-corstone1000-change-base-address-of-FIP-in-the-fl.patch
>  delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0005-plat-arm-corstone1000-identify-which-bank-to-load-fip-from.patch

Applied, thanks!

[1/1] arm-bsp/trusted-firmware-a: corstone1000: update Tfa SHA
      commit: 2de4b3c893cb62ca4e6d33b00c49d7c65c3a6b1c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

