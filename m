Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0010E776CB
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 00:06:10 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.97803.1696291561994316980
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Oct 2023 17:06:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=x/668JSS;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-77386822cfbso28380985a.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 02 Oct 2023 17:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1696291560; x=1696896360; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6USGdnCGLDU6oLJ7ewZ6Up5L+V6b/uShr6u9QawR3E=;
        b=x/668JSScqhjqc7iPMiwP2/OsKSudYyAxd714FFZzdTJ/+F1SQ0AulWYEA9lcCA5tj
         MNeiQ4ZeNSuSC2d1ZK4WuRHmPiwgIBW43m6t/5T4j3S0Nc2hyRRUHnfNUv9tOg+qOkc3
         h6DWUeSZMOIiS7jHW2/mHNPwkH64VuBSKvkzUvzj+m1HVGFcn0RbbNmtKuwU0rynORNj
         Rjvq0lKm01b1//2dMrPiwa0Qjqsb+rjk/hA6mayGTMITNfwMIcSOhgq3dpRmkhvav9Zq
         SBZX8xKPvx5Y6yUyxbzylrpTPLbKlxo8245qe5czy2Ea10sJX9sev+g5ngFwkH8y9v+a
         P33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696291560; x=1696896360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R6USGdnCGLDU6oLJ7ewZ6Up5L+V6b/uShr6u9QawR3E=;
        b=Yp0onc97gl/vyNWewePNTdEModrsi9gBQ2lItJUVBUCd06yljdWvp+yJJailbI32cZ
         gjjvZCq0YastCDIPk/7tB4elVPFlvdM4P8qyk/T6q7aVA7eeYxp2ehRzjY4/ZH416acM
         vCgRP1drv+ww/m3MmOtbZ1OTvAT7M0R5mZ90wMfDqQ7+o0eMsqltbeoB9qwkRMTp0BSB
         ZEH8lRRX/9xN1ed9d/nseKEIKzsrsseOrpSwTcfFxWZIVW1y4PoXxBVFAJ+/CdmNm+4+
         ErlE2/zkJ4fDAr15H2Vygtp3Cc4MJjjlNosscAqa+6hW3ZLr7w01orRkr3j6op/YGj3i
         pbwA==
X-Gm-Message-State: AOJu0YzANYHiruAxMNGAs1uKohfKRfuk46dddfbenovRoKoV1i19GKUj
	LEK2xek4+wAZ5kw6sMCXlyx9piZHjiQMgG+yiKo=
X-Google-Smtp-Source: AGHT+IEqzFRTGuBaO6zhbzBZmmxY66LjgTTO7GEhkr5GDe1z9EM6wzADSxodSNsvhGmWASL9NRsXPg==
X-Received: by 2002:a05:620a:3916:b0:774:a80:3e0b with SMTP id qr22-20020a05620a391600b007740a803e0bmr14638704qkn.5.1696291560535;
        Mon, 02 Oct 2023 17:06:00 -0700 (PDT)
Received: from localhost ([2605:a601:a684:4100:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id q16-20020a05620a039000b00770f2a690a8sm10238qkm.53.2023.10.02.17.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 17:05:59 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com,
	emekcan.aras@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/5] Introduce authenticated capsule update
Date: Mon,  2 Oct 2023 20:04:59 -0400
Message-Id: <169629149983.3232944.16398648087738424659.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231002104323.1967358-1-emekcan.aras@arm.com>
References: <20231002104323.1967358-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 03 Oct 2023 00:06:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5102


On Mon, 02 Oct 2023 11:43:18 +0100, emekcan.aras@arm.com wrote:
> From: Emekcan Aras <emekcan.aras@arm.com>
> 
> This patchset introduces authenticated capsule update support for corstone1000.
> We now use mkeficapsule tool provided by u-boot to generate a signed capsule.
> This requires efitools-native provided by meta-secure-core and some adjustment
> around firmware update agent in trusted-firmware-m.
> 
> [...]

Applied, thanks!

[1/5] CI: Add meta-secure-core
      commit: 0be13f383d68ffe345f69f612dc54b3c456513f4
[2/5] CI: Include meta-secure-core in corstone1000
      commit: bbc1732e4a0bcd8d909ae7d73cae2b6f27838ab9
[3/5] kas: corstone1000: add meta-secure-core
      commit: aafcf2145946d2501ff88966d4f41e0e2eee2f86
[4/5] arm-bsp/u-boot: corstone1000: introduce authenticated capsule update
      commit: fdbf5f55ad14de0edceaa091067839f5f07f35f6
[5/5] arm-bsp/trusted-firmware-m: Enable authenticated capsule update
      commit: 95789365f7c17df91e52b5d72263f2a97e68b549

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

