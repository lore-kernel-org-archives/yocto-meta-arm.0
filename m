Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E689F10F92EB
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 18:42:20 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1150.1774982540204595542
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 31 Mar 2026 11:42:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=bBDtMcTx;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8cfc085395fso625072585a.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 31 Mar 2026 11:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1774982539; x=1775587339; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1HJwpvfDNN+5KdeD9eC9IIUnfegtrFhQ6HWUEcdPHCY=;
        b=bBDtMcTx9oxJqrmXYXRMfQsJjC6lEbEQ4ZwCVOhuex7JvPT/RA2HR6IUbOAYKzOHGN
         K+O0Fcj4e919h8ch+Afe9KBX199nWlDaNK6C145RyUaZKqceXZmb9LyD4+mFoCK1oPRH
         rgYJ4PDCzTmZdOf1FdqEINouXey/lMbplYqG6yWzHnHkEztEYoc+/NHqA89sw1C5lLoE
         fEXCoekigRp9+o2zxSSR+01+6rhcYUtIfX3fc2MCQDgk6mgOm08EJf+hZ3Oq+TLKC5Yy
         VL6N667Tg2uy2dbbqVClXD96HcHaGANDR55vgDJKGM0Z5zHSjXkpdPI1xPoigyM+qAtm
         IVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774982539; x=1775587339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1HJwpvfDNN+5KdeD9eC9IIUnfegtrFhQ6HWUEcdPHCY=;
        b=Lr8jDauzrbeniOnDFOplSTvm62027CLc5aHh+ACGDNsEoy0J21DJbkk+wp8LH5+G1d
         HxdKmyv/ZrCPbOgx8XLmcLpCUtystVw+Q2sTkpKyhcCX3wsdkERgeDyzwAY1z9RidPx2
         LBcjNEmUMZP04nOwWuG3AeXALe0XstN4cHL2L5cfygpDs4XxntBSShraFszyS9F+LZM+
         CGeksGZQ9lTjFiSpEnu3f0wtlK6f8Uc3f1zRvl5VFZd/0DHuzdqC4xJmdWRLnRURifkv
         OIFFs7HBg39ZZFFmmIRdLlpK9U1Enp4qACS7GzvXvfpjtJVCAvYjdDHQCvwGxgUrnqRJ
         txOQ==
X-Gm-Message-State: AOJu0Yy86nfg4jdF8lhybz8/7Wj6Pizxb6tqLm14ax4h+uEMX4qxrq4j
	ZxHLbIpF6TJBRFP8CrjNAufFJsFlMjeVJmtnxNbrSCDYVRpREyFmD4i00juGFh8GpCSK5NveHqf
	WhDQ=
X-Gm-Gg: ATEYQzyWIKKJD6YI6NGRFknZuLwofUFt/N4keZcrPqKl9SGiqK1WEoy5c5huR2WrYb5
	mP19HsVH+J/Uc4wFqkFOWgHBFsfCoyiYtrg3NoxdR+xhAlMAxzA0eDYAxe5t9ZA/csKZQZtqsuk
	Bbz6Vg2L8GT26E5r9Wwy9B2tLtpcfmWtqshPluzGqPB7scrGGS1J3e36sLbLsKbEcrBtHtsCgpr
	gaM5fy+jflKRyyOdpAUAcaIp2kLA0xxx6LSMgVkAEd9S/qWhjHZcyeOHyHmAvqCyFzC2OXpz2bD
	LQTUct0xL7fWF0yESQtfM7JWhgYZV7NupUTaiP6z9F7KY/pPr+CkV++aSt/pMGACPtKIKOkEFf+
	cCj3I45s6OrRqsDVbOMx04+fl+GVrmGR0RsG+8Nx4NlPuAIX87/Tg5g0bf546pyGdJE9Hf9TUlL
	ICYXRlTiHxyx7XceaRS/oTAFk=
X-Received: by 2002:a05:620a:1a05:b0:8cf:c4d7:de3 with SMTP id af79cd13be357-8d1b5afcefamr122712285a.30.1774982538744;
        Tue, 31 Mar 2026 11:42:18 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d027edbfaesm1063863585a.1.2026.03.31.11.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:42:18 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/6] CI: use core-image-base for faster boot
Date: Tue, 31 Mar 2026 14:42:09 -0400
Message-Id: <177498252919.209741.9201600398741840996.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260331130702.56223-1-jon.mason@arm.com>
References: <20260331130702.56223-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 31 Mar 2026 18:42:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6996


On Tue, 31 Mar 2026 09:06:57 -0400, Jon Mason wrote:
> 


Applied, thanks!

[1/6] CI: use core-image-base for faster boot
      commit: 4379b78bd6a8302e0a55823cb15b62d57678b3f4
[2/6] Revert "arm/execstack: remove, no longer needed"
      commit: 4eec974baed18d4321cf9ca37c1da0b7cd624a26
[3/6] arm/fvps: rename rdv3-r1
      commit: f86d9c4f227de4419f7147fa9f3a94f258b1c323
[4/6] arm-bsp/rdv1: add support
      commit: b5f3f7a6e2062464ab91f48ec81a90b9184d1188
[5/6] arm-bsp/rdn2: add support
      commit: f9d0ecbe25341c35b01e1319b3b0a36c033d5f32
[6/6] arm-bsp/rdv2: add support
      commit: 43c2bcfed58878613044ee424542cc0067893e1c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

