Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AFC5C4167D
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 14:42:04 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web10.12635.1699368123179404753
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 06:42:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=05k2YKrI;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.51, mailfrom: jdmason@kudzu.us)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-7b9cd171d0dso2350922241.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 07 Nov 2023 06:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1699368121; x=1699972921; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hMCiTfpeOCCFLepxkbWvWgGhNGVfVV7O8AISvdE/FdU=;
        b=05k2YKrIrfEadTw53wRMOFhXKBxdnb8ldoCdc6ZohC3Kit4lTNgz2SwNZU5oKNTIkq
         3IWaWR0RF+4FJTyxPJGqPFctSj1Zt8Il0NabRachsGUdPw3bpHr2k6ilwVe13KmdYNFo
         ckbz0zbF/HcfcYLP4Mdp4Tvx0vU7TT04DEjpZMPHFn9maB63lZuaxVhyX1yQJ+vte6kW
         sntmBNAiy4hfG5dqkprMEBTotZaOYgNwZHMctxDe7yJP3THBgglBDQu5sTKMPqybdYbp
         6+3WbsO5yNIZxc9cLUOEtPJiqoVblKiJrA6TMWl6uZuUuWUjfcT45yJ9yvBMJEHHwpL5
         Mt0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699368121; x=1699972921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hMCiTfpeOCCFLepxkbWvWgGhNGVfVV7O8AISvdE/FdU=;
        b=LqAg9DJhJIAIP6QdPIm6JgkmAY/CRzsr2qtS+gZnrR9jVBx8xmXaFpszdkEvmmmPpY
         /sp8YqNKiIaztehj9U0viUJa+hQnqY9uiE1p0AREGi4GwTENP4kGMERAyT4EWOrE/2+O
         BCMeAA0a8Sew0cSRO+1fSQS8L6+9GcM+x4SexOAXhsoIkWXGOfDOcBj1mCZQ7o1irAgI
         5/JfNg1LyGjRLwGtZgzh3iLLQQ2cE7RQazkp5buA+BxiI57oUJfmgp6/v912lyk8WB5L
         hGejP5Y2gjFfZW8IqYYo6pYLObjR2Qd6lt0IQheRRoX65Bw4Z3s0K1E7NJ6eDr2dL0Mo
         n3Jw==
X-Gm-Message-State: AOJu0YyCuOHLyFhUV/wl+y8xwcUbW+Yu0kvks38qzki8Znbs9Lt+6Sp3
	VSLjj8Gpw+pDDf06VSGwahgduj+zokdamoxqtsc=
X-Google-Smtp-Source: AGHT+IGza9+HBBEluXgNAJ4Qj7NAKAjG/gK0zR0ewIXx3NbzEAgS6cTT0Q1qgubzM1rucXLfBSEBxQ==
X-Received: by 2002:a05:6102:23e1:b0:458:3bd3:9af2 with SMTP id p1-20020a05610223e100b004583bd39af2mr30694641vsc.13.1699368121270;
        Tue, 07 Nov 2023 06:42:01 -0800 (PST)
Received: from localhost ([2605:a601:a688:2c00:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id ay18-20020a05622a229200b004181c32dcc3sm4348329qtb.16.2023.11.07.06.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 06:42:00 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH] arm/generic-arm64: remove obsolete SERIAL_CONSOLES_CHECK
Date: Tue,  7 Nov 2023 09:36:58 -0500
Message-Id: <169936781963.1895078.6294553181889296637.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231106145010.1059052-1-ross.burton@arm.com>
References: <20231106145010.1059052-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 07 Nov 2023 14:42:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5215


On Mon, 06 Nov 2023 14:50:10 +0000, ross.burton@arm.com wrote:
> This is no longer needed as Nanbield uses ttyrun to avoid re-spawning
> gettys.
> 
> 

Applied, thanks!

[1/1] arm/generic-arm64: remove obsolete SERIAL_CONSOLES_CHECK
      commit: e902f06d588df26770ee97726ba1416652ed3470

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

