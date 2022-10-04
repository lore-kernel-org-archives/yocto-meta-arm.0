Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE556C433FE
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 13:19:47 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web09.10534.1664889585292450076
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Oct 2022 06:19:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=P9oS2JlT;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id ay9so8091750qtb.0
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Oct 2022 06:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=CVxsdNfig127XflwjvM57+gnfpB8uoKSIKgpGZx2iR0=;
        b=P9oS2JlTntRPrM1zELPllfwy0keXFnTTas2fDmKygFNbzt9hFIP4W2RTcR7832VhdZ
         z2r6uPMyu/BTNXOXbxNrbAWWb6JyTu6FNJKt+Ys851tcrob/YerHZsh874FDFF4fAhbl
         StxD7WfS9BpjbqEQorS9bhDVw+2ocRFTAQtvTmr5GmKLK/t7oQjHPHeAQrW5pwc9XrO/
         CuoZky0ZctGgF97yR6xv9f/7161ZnTwIx1c1ze0am+3uhM7jHArESGlBV0hTHVVjg2lv
         3Pch8xkg1VQLwAErI4toY/a7C+jX06sx51ksOc5oNJbwUGsDxSE3SvbsKlFptSfd4Gk9
         TEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=CVxsdNfig127XflwjvM57+gnfpB8uoKSIKgpGZx2iR0=;
        b=DoHSE1Sw76rJlsOfG16SfsVAbgOj3plXh6dl7JURpM/QGrtVNB6MfZQC/FkMBAEPs6
         q6tyebKkQOgLGHQxYV8p9LSnNJl/Zw+RLCHDlvYgpJIwHh9bx1zjg3E9E1r17/2M2bCM
         dDmueZbVDEKgXP1OOwNEMaZdkFEOw6KkW7/4qyj0RSn+aeTXFWPI7gpWz660NEt1DWHT
         jW87YqUdQ8yileEkT5ZbDz3dnRyP38HWTCix3ynHCbCL81Iw6nCzdBL/iJRXa+GR7qkz
         nc8DHJN9CqTXmb4aOBotsSWZ9h/IyoQQ/I/7eFgU8c6fxEqME1QDjRaDUocRDsNN20oU
         TlGw==
X-Gm-Message-State: ACrzQf1+EM82m+qpT95H214Iw9fscZPwwauWKQtW1lnJ0FVcgziudje3
	nkP5yIGDPQGxVDNMPLTLzOVKt0zzfq20JIjz
X-Google-Smtp-Source: 
 AMsMyM5oTI3/cfyAwwmPP5iaPpYz8NxxGlUIRX4Q8SMZNVhj0mP2O+96Ynz/6Z40m9fy2ExZIsg90Q==
X-Received: by 2002:a05:622a:620a:b0:35c:bf9e:8748 with SMTP id
 hj10-20020a05622a620a00b0035cbf9e8748mr19508630qtb.494.1664889583914;
        Tue, 04 Oct 2022 06:19:43 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 u22-20020a05620a431600b006af1f0af045sm15155774qko.107.2022.10.04.06.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 06:19:43 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Sumit Garg <sumit.garg@linaro.org>
Cc: denis@denix.org,
	ross.burton@arm.com,
	daniel.thompson@linaro.org
Subject: Re: [PATCH 1/2] arm-toolchain: update Arm GCC to 11.3
Date: Tue,  4 Oct 2022 09:19:30 -0400
Message-Id: <166488956989.128453.10455360600943879071.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220926071605.123085-1-sumit.garg@linaro.org>
References: <20220926071605.123085-1-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Oct 2022 13:19:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3919

On Mon, 26 Sep 2022 12:46:04 +0530, Sumit Garg wrote:
> Along with that add a new variable ARM_GCC_SUB_VERSION as newer clubbed
> Arm GNU toolchain releases includes a sub-version like the current
> release being 11.3.rel1 where ARM_GCC_SUB_VERSION=rel1.
> 
> Also, update CI to this release.

Applied, thanks!

[1/2] arm-toolchain: update Arm GCC to 11.3
      commit: df99894eaa11f74da25e477542ae5df63e570a64
[2/2] external-arm-toolchain: Enable 11.3.rel1 support
      commit: 6001998caa3615f31ae7d9a05269699456629367

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

