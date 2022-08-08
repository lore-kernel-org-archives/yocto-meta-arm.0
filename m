Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E95C7C3F6B0
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 19:33:22 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web08.2915.1659987198991910532
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Aug 2022 12:33:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=M5o2Bn61;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id w26so2422707qtv.9
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Aug 2022 12:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=rM8VlnjmNaR5G0w6kbRxNMKwJpMUTBOR5Dtq71OVSVk=;
        b=M5o2Bn61GsMgneLbVtxUmVqvIHwmIU4LHXLGBNhZTtvwwKfj6qAPCFpg9cIRZ1FEqz
         smgBMf/18HrZMXxsSeF5xqdgg3x64BOiwSxK376fPsHXuGH1QB2knuPTHuPmeuew9Jtw
         CDwaFjYezoKJ8/64SQ5It6SyN0GORzce7kejChlt2QSrjhLU9k6v/zoypydXUJtltpnC
         EGHUScxn8x8WbcFnQbv8HFgUXCpdVeT7vUiXZLfLOUab6k9RfXEl/ta1uqtdb1VTfrPe
         xtW1HqXxGOIJnsmWsvKr3kWSiI6pjF1TWGn9R4VHm2pCoEaCNHpoixh6CNeZZZbDvgAv
         aY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=rM8VlnjmNaR5G0w6kbRxNMKwJpMUTBOR5Dtq71OVSVk=;
        b=tejmfG5BcictaVPvRdn1Fp+mVGKRUa2kXtzzBWpuR7TpV6F3G1QVHIIdDdfnAXhSQK
         uceIXYI0Hyw0zlujEK9riQCKda1WSLlDBY7vzhwmC9lXRfoRyzRc/O9T7BFs1/5cMF3P
         r9+kq2/NUkBuTmL2dDp11apNwXJnEKYAiV4mEOvRRpfL+yEXxWIBB3Giu5xlZlBqhHt/
         QQNrzenz+ehurZv7h7VI9LFSJW48oZZEJe5xAucvcVk/x+E00Jg/6Rf6bnIeHwEVjd8/
         NTOUnCgcnm8G1hlAdE7aAgzvln4cU5Sf2MrH1Kt8MHTEQm4SyS46Z7bGz3Ovs+bRIt/V
         Y1SA==
X-Gm-Message-State: ACgBeo3PHJHEiNjQgTW57nVa0dCzDqrZZ9pATC99KxB3v03ckGIBAgW2
	XIZpH2JG8H2w21KlNgdH2MRHD3I44L2iIg==
X-Google-Smtp-Source: 
 AA6agR7OHZNr6AYJ0PX2nK2hDGt+c1LUN+d4Ct4IdOIX5xorW78qUc3iSgElpND7894MGsrxjWsViQ==
X-Received: by 2002:a05:622a:216:b0:31e:df05:8154 with SMTP id
 b22-20020a05622a021600b0031edf058154mr17537415qtx.669.1659987197582;
        Mon, 08 Aug 2022 12:33:17 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 ew7-20020a05622a514700b0031eb65e1cb6sm8493260qtb.5.2022.08.08.12.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 12:33:16 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>,
	Diego.Sueiro@arm.com
Subject: Re: [PATCH 1/2] docs: Update FVP_CONSOLES in runfvp documentation
Date: Mon,  8 Aug 2022 15:33:08 -0400
Message-Id: <165998718800.2694832.618076795430673700.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220805144756.2492832-1-peter.hoyes@arm.com>
References: <20220805144756.2492832-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 08 Aug 2022 19:33:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3659

On Fri, 5 Aug 2022 15:47:55 +0100, Peter Hoyes wrote:
> The runfvp refactor to enable OEFVPSerialTarget created FVP_CONSOLES
> which maps the names used for serial ports in test cases to the names
> used for serial ports in the FVP stdout.
> 
> Refactor the FVP_CONSOLE section -> FVP_CONSOLES, noting the the
> 'default' console is still used for the --console runfvp flag.

Applied, thanks!

[1/2] docs: Update FVP_CONSOLES in runfvp documentation
      commit: 74a36b024f4d20c80e7c686cdc6d829d60a2689d
[2/2] docs: Introduce meta-arm OEQA documentation
      commit: f83aad2ba9d43327bcae28b6c05a8a8ab9d5a519

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

