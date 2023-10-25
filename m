Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7027EC25B6B
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 22:51:02 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.57812.1698274255700235150
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 25 Oct 2023 15:50:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=X7G4f/sI;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.50, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-66d0760cd20so2188096d6.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 25 Oct 2023 15:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1698274254; x=1698879054; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fqhqi8Fz2sGiatGBsw+EmbOhCFXYxnixVUPwjsrG7d4=;
        b=X7G4f/sIcR2fG0quR0EPlmCp4W2II0jIalF9DLR83bEUgJelcTp6FRDpePB7ReZBBD
         o4XzW2s+FyOL14OAogkjde629hbONfadZKl/BCL33GqTX2D9lsL01/iVTisr7JPwq25Q
         /cdAlC/5z4hEKd4EIwOJ+FJS9Ee2F0+NSGnX545Sv4NdaestvSL9Jjn6G4JshVzbNBt+
         DfKV9dhCzU0KLL3g5jnfeo5zwKSO9GttRaEsQmqGLCBL7A3NXmDjK81XBmtqVbr2poLo
         KQ67YIMxgbgExVvLFJIyqW5NRnWnkWDupf5oI2yU7qaMuq0XzbTMIn0aZfzw6/C0QUtW
         jVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698274254; x=1698879054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fqhqi8Fz2sGiatGBsw+EmbOhCFXYxnixVUPwjsrG7d4=;
        b=dnNH2QOMcKOvZ9WuJ3MxyqlXwAkmTfS0QbA/UpaoZQnbVlW35KvG0vVNIEeeWkaexY
         zLaqxJ6pzw7E605khh2GtLgQdEWsHUq1F3yK+NbNadmOomncDFjdC2okpYmgAJ+astng
         qwapNlewq0zycFegkrAVQ4/lJJPFevKiDBgyCxhsHU2MUt3OvFQmfV1eqt979X/qNtmJ
         zs3ZGbosOIjOFcIZAft6FHoP/Gr4f+Alld3CFMe+gEZ2725E2X7N+d8+WM2cU3wU7CFO
         0S7aYuJ4+4NF81sVbhWiyscImTAmYUu9KxcIDded/r/BTLXeEky5qedaJs47PZwhLRpE
         IVuw==
X-Gm-Message-State: AOJu0YzMTUXhD2KnCxcwa8NDq62k909KHXuoTNc5Jezt//RiaqMou6Cx
	Qo52/Xw4mOdSYl4c/q3A/LVgMXM/NbN3h6Yjs3U=
X-Google-Smtp-Source: AGHT+IEjFTmPlOfHlMjypnAWafDWFGHqWWd9XvxHAkqnA13iXbmcXrv8rfD6nt0BxNPDzZs9RQGaFA==
X-Received: by 2002:a05:6214:29ef:b0:66d:99cb:a15 with SMTP id jv15-20020a05621429ef00b0066d99cb0a15mr1339977qvb.28.1698274253857;
        Wed, 25 Oct 2023 15:50:53 -0700 (PDT)
Received: from localhost ([2605:a601:a684:4100:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id cn5-20020ad44a65000000b00656e2464719sm4777680qvb.92.2023.10.25.15.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 15:50:53 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH] arm-bsp/u-boot: remove 2023.01
Date: Wed, 25 Oct 2023 18:50:35 -0400
Message-Id: <169827423605.1366514.1044037543164567770.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231025135956.60268-1-ross.burton@arm.com>
References: <20231025135956.60268-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 25 Oct 2023 22:51:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5174


On Wed, 25 Oct 2023 14:59:56 +0100, ross.burton@arm.com wrote:
> This was made redundant when Corstone 500 upgraded in bddec6c.
> 
> 

Applied, thanks!

[1/1] arm-bsp/u-boot: remove 2023.01
      commit: ce1cb5c7403507c8c11c837036abdad3a10e539d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

