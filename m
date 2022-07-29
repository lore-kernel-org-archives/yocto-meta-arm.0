Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D024C00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 19:16:34 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.990.1659122193853113511
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Jul 2022 12:16:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=ts6K1rlg;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.181,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f181.google.com with SMTP id a9so4003718qtw.10
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Jul 2022 12:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=31cmj3bHwUcjanI2SgbxYjBJr0U7CxAA3aL9tf2RMx8=;
        b=ts6K1rlgiycKCm4J6Jr9x94cbK64QCFt+YtN+O/a8kWBMNxLAcNr2BVPV9+fKA9EZf
         UUIIVy39kkfHJW2b5ezkgZ26VtYKvcraOhvTEMmATxP46E7BdZF9izDUJfAulNlAKjxU
         W9VsrEVdB2ul+vaJl9QY6EKAcZVXicLjhlyivWQ6zcYP79Ke/USBvbY5RkyxVMZiKM8D
         FyxIhaDd4DwmuCCd+zQyAy2z6F639xBJXjCKXuYgejnyzU/acg2bwXwzR4razXcK9Zcr
         bJvrhv73LKaUnuaF6DXECCiw595zHsGheRxgWfBsfbj70TTvOBgJTgNhLXEZcON8ifCT
         1ItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=31cmj3bHwUcjanI2SgbxYjBJr0U7CxAA3aL9tf2RMx8=;
        b=D1lrPjjd4XEwBoefetW2earM+wePHwn2aYTgMoCIoz6hjrZmKdYxKPWlQfFVN6ZBbf
         fccSTnaHqOJBOVthh5pjNSOkvyCDYPJ+jeN/jvN/LUzyCLLwo1WjnjKld27HkeIwyzLh
         bX+ih3fDla2XgzFj+64P+z2WF3ja7ZgFDGTnsgSn2gfDMaPJiWSAgJ/Ow2Yy42ck4Xic
         FmUIPHE069VXSwaEcmOG0h+KubRl5gcGQFTNHhnlG3kH1NDWxDAlXZXfVqk36st2tyRK
         e/5Mkm2MSM+xn4QWGILG7SfRYA2h1S/q02qCU0C6B9Nvv4AkK2jXaWhPMhLFS907e3ld
         yg5A==
X-Gm-Message-State: AJIora+ktUHWzdRWrfN2x8p8nOGvcENJEtwcuI7IhtLwbuDVZUizqev7
	kDUROBYgmcQLrQ8kukY/m4OOhqTqygRmEQ==
X-Google-Smtp-Source: 
 AGRyM1uSdY2ffo/CkKkwbOH7wbbbVEx1LVn8c2GXENHVD9qFsPlO+rkaZ/sS3ahNKPVMuZAO6Tfs3A==
X-Received: by 2002:a05:622a:1710:b0:31f:340:41dc with SMTP id
 h16-20020a05622a171000b0031f034041dcmr4730635qtk.311.1659122192431;
        Fri, 29 Jul 2022 12:16:32 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 i12-20020ac8764c000000b0031e9fa40c2esm2495558qtr.27.2022.07.29.12.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 12:16:31 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"adam.johnston@arm.com" <adam.johnston@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH kirkstone 0/5] arm-bsp/trusted-firmware-a: N1SDP trusted
 boot
Date: Fri, 29 Jul 2022 15:15:46 -0400
Message-Id: <165912214658.603519.13653414903948778163.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220727155643.2786523-1-adam.johnston@arm.com>
References: <20220727155643.2786523-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Jul 2022 19:16:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3618

On Wed, 27 Jul 2022 16:56:38 +0100, adam.johnston@arm.com wrote:
> This patch re-configures the N1SDP for trusted boot, using the changes
> published by the Silicon Solutions team in N1SDP-2022.02.04 and up-streamed
> to trusted-firmware-a and scp-firmware.
> 
> arm-bsp/trusted-firmware-a: For N1SDP only, upgraded to 2.7.0 and configured
> for trusted boot
> 
> [...]

Applied, thanks!

[1/5] arm-bsp/trusted-firmware-a: N1SDP trusted boot
      commit: d9c6ff98c316da14d225290471c586da824797a2
[2/5] arm-bsp/scp-firmware: N1SDP trusted boot
      commit: 1e13b8b419d119a133882aa6db9d5ab17e4cb96c
[3/5] arm-bsp/sdcard-image-n1sdp: N1SDP trusted boot
      commit: 01aa5431d66c1dbcd5d8f87de16f49af5ccbb9ca
[4/5] arm-bsp/edk2-firmware: Add NT_FW_CONFIG to N1SDP to fix aborts when accessing virtual memory
      commit: 2b392ebd3cf92cf1f62b53a13774649ca6be11dd
[5/5] arm-bsp/sdcard-image-n1sdp: Fix N1SDP dependencies
      commit: 6301b32aec4ff3b1c1545df6a0a5247a15491d14

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

