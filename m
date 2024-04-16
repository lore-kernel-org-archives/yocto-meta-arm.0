Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9406FC4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 02:18:35 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.10664.1713233912611328998
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 19:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=LuGT3sJA;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.48, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-69b5ece41dfso11524446d6.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 15 Apr 2024 19:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1713233911; x=1713838711; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOtpLedmVj3flW4ZZsOMvbeF6oLGwOlu+m/6sL6QJzA=;
        b=LuGT3sJAqM41rP/yvljSMgq1sJySCULqb9zt2uvp83vdq8JsOydSjdF+8BY5yUxQT1
         tgDAGqWdxCD6xkxfzSJaas1Y25ecXgcwDAU+Tr9ydRXqu0mcxKm4aX0GPQ2iGOlikKDv
         4zTUJz8u3S1cAYkFp8J6DUlygJFVangZuzqGOpqVXLEhHff+GbZV9LwhetOXlj3Obd1g
         ShNW2usYej/9t5yg8+yOSVNTGUUo31PGHD59Je4zv88t+VyoR/9Mwe5b1HqS+maZ6sq4
         pCfOS1HxhrFGGsXgR/k1M1jhmVs94Hxsl6MEq7XJ/GH1Nh6AFPZHDUfvdHxlJlyWiUUP
         iQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713233911; x=1713838711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tOtpLedmVj3flW4ZZsOMvbeF6oLGwOlu+m/6sL6QJzA=;
        b=h0isy9HbLwbEe2tRCNmtMAmvKnp00BUe9ahgTdpRtLo2kmxb9sEi/rUVJeDzgUw6mK
         +MoKQUCMPP1zwutgMbutsOH8gKmvJeAEK1IVMcWnY3YnNuT2FhVkEA6RTxzbSf3jTSHV
         K2JVzNBYlZGp1+ezq5HGD51B5a3I2S8w6/0yMXIGK4nbWYO2Gf4EZONRv3B38nNPrEhg
         KkPnPmEGUkwSwn7UwGBFmAsysGLChsSXmBuyesL1JiotjNiVDUIyJ9wYQ4x5/4TFofQM
         IP0mhreVex0Ykk+oWjW+gtv+xcW50axdXHEBA8AW4jynx48vioFLHknLwT/2d9b3z1MR
         AFHQ==
X-Gm-Message-State: AOJu0Yzmq5MpmsS4/GWYQqxwGWy/olEmt1whJw/2On1IsrIzzF+NXAao
	M7GPw9D7xXpy5ssu2pDwPvXPC37NHK8XUudJ2gt/sKOq5ueqPkbx5hWEPNttX3cWsQdfBDiHwvs
	=
X-Google-Smtp-Source: AGHT+IEFd9Ly6FGBGUC/L4yoxdhJvD79Z4VpuXtV9tEA7/lkwzDMCEGs5QF277+bctrTuj4ZMW49+Q==
X-Received: by 2002:ad4:418e:0:b0:69b:59f5:34ea with SMTP id e14-20020ad4418e000000b0069b59f534eamr9073109qvp.42.1713233911629;
        Mon, 15 Apr 2024 19:18:31 -0700 (PDT)
Received: from localhost ([2605:a601:919e:c800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id x9-20020a0cff29000000b0069b10f48ecbsm2808761qvt.47.2024.04.15.19.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 19:18:31 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/2] arm-bsp/sgi575: upgrade trusted-firmware-a to 2.10
Date: Mon, 15 Apr 2024 22:17:57 -0400
Message-Id: <171323387900.3101369.17843424112174555464.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240411211416.2806039-1-ross.burton@arm.com>
References: <20240411211416.2806039-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Apr 2024 02:18:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5546


On Thu, 11 Apr 2024 21:14:15 +0000, Ross Burton wrote:
> Remove the preferred version so that we track the latest release.
> 
> 

Applied, thanks!

[1/2] arm-bsp/sgi575: upgrade trusted-firmware-a to 2.10
      commit: faea66de04b5fb3e9ea5f88920632f02fa6e3a24
[2/2] arm-bsp/trusted-firmware-a: remove now-unused 2.9.0 recipe
      commit: b26148e9debb1d92dd854608dc9cdcb10b4c8e40

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

