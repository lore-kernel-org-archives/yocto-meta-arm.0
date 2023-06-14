Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C18A5EB64DB
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 13:08:55 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.11216.1686748127019520487
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Jun 2023 06:08:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=YXiHIZnF;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-75ebb3d57d0so200274785a.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 14 Jun 2023 06:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1686748125; x=1689340125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnxedHT2kHO7imbuAGhzJChNGbj/W6NOPUCGOqWHSWw=;
        b=YXiHIZnF7lyEqsuyJuNUHM2g6xGYA7gwrjb6HbG/s7JozZpfW6ZmB2mbbefufysYlu
         +G7+nU7Ll5TLC4fEkNxWKkm/CVYBKvl5qOgDFLFvQO18IdweDhouGAX5VxB2vYrdA6Xx
         gQsGPReGxdzZVu4hsYcbfo10SzsB/7dQ301wc0/BCcyxFfU3tcS1X+SOaFCUPL5c5qvU
         e0zVyrzGSIWvVsJPL4Pfq7dSdY/4XfG4PCEpznxfa7ZXTTEHR0yaK3nNhVeAl9G/k1ZS
         skYtDcDeg9KRIgkI3Z9y8OZ4xz9MMPy/5mXHkGC8TRLHLc0p4xmVzY84qmwF1VoU1B/h
         R8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686748125; x=1689340125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VnxedHT2kHO7imbuAGhzJChNGbj/W6NOPUCGOqWHSWw=;
        b=WT9/3zwFpEvFexktqPx5pyJJF+8glye8R0cDgUcr/YJnjlAlcd/V1dI/K28TUWgqa6
         AlEzifZ2YYyRK61PKKebaHIbsa7y4GBP5eTZ34MOnSO2XIgGVx1R/G1xRZxLbE2XqRKB
         sMuCHG0nwwBu85q1S5apqhFU6BlrDKiSZXqSq4KQnFPm/nFxqL0r1/Y3bvUi6hYSdCeY
         dx+pUdgDnp+ofy6Vp9YaGjEqj9rln/mqqskKnlOVevW1Gt70DULWAA5j/2V6Rx8k1uF7
         ENvJy2xqRniSgGuKK8LQEDlbd/Jn+n/YKDa/4e8CyX5lU23r1QySe0MP9TEX6wTKbH3k
         ncrQ==
X-Gm-Message-State: AC+VfDyeF1kgonllear3fLBkeG5UwSnnR5RlofSvaehUNpqRRsblSQ4w
	wVbhDmXOJvMVlm9DWQ6sQGoGUU0aVQ7/F2csMS0=
X-Google-Smtp-Source: ACHHUZ6NtxSoF7VcdUwA8T5wBgo8W9MXuXzW/gf6Zdot3Dum1sSPZZHX1iP+0xck+NIGaYYCOeIiig==
X-Received: by 2002:a05:620a:22a6:b0:75b:23a0:d9c0 with SMTP id p6-20020a05620a22a600b0075b23a0d9c0mr14670837qkh.22.1686748125670;
        Wed, 14 Jun 2023 06:08:45 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id z4-20020ae9c104000000b0076077538b0esm2281489qki.17.2023.06.14.06.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 06:08:45 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"abdellatif.elkhlifi@arm.com" <abdellatif.elkhlifi@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH mickledore] arm-bsp/u-boot: corstone1000: upgrade NVMXIP support
Date: Wed, 14 Jun 2023 09:08:00 -0400
Message-Id: <168674808553.2420450.6634421822733176564.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230613105203.26253-1-abdellatif.elkhlifi@arm.com>
References: <20230613105203.26253-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Jun 2023 13:08:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4778

On Tue, 13 Jun 2023 11:52:03 +0100, abdellatif.elkhlifi@arm.com wrote:
> The patchset has been merged in U-Boot master
> (https://github.com/u-boot/u-boot/commit/c9c2c95d4cd27fe0cd41fe13a863899d268f973c)
> 
> This commit upgrades the NVMXIP patches with the merged ones.

Applied, thanks!

[1/1] arm-bsp/u-boot: corstone1000: upgrade NVMXIP support
      commit: 4b3ef7bf849c569661e515be38c166aa2a0638b2

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

