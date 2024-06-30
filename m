Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC574C27C4F
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 22:23:29 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.6865.1719786203159973327
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 30 Jun 2024 15:23:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=X5gxX6TF;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.175, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-64b101294c0so19954377b3.1
        for <meta-arm@lists.yoctoproject.org>; Sun, 30 Jun 2024 15:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1719786202; x=1720391002; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkH2/s2AlC34pUZVJODD67kNXs5kAfByBQTDT+HZegA=;
        b=X5gxX6TFjUCPOv1e+8TaCpud9MMquAM+jmOrRgyew9eYcxStOyiWTz8pdJ8X2g3/OP
         QfWs3u9A4+ImCI6Dr2cWbjRt6YRirKP/ych26V+Jt1CputDxMwDyHomYmP1FcroLRf9q
         rCzaLW/V90/fdVwFOuK1aARBhmnyxZ2kFWicBiPxDKsHTtNRkNCJ4xLHdQYLIsjDusCk
         GtyOP0IQbgCvYtRbRcj+IZzlBgbM0+VoR4Kr/WHs4mhGA9iQ8zjyc88nbB9nFZK5YsYx
         eiexxdxHsDdz/UlBk40I0eaXW5FJ3pmbWCotX/THHuQeK88ZsRSIIR0WY0dIbgE7TYqD
         OZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719786202; x=1720391002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HkH2/s2AlC34pUZVJODD67kNXs5kAfByBQTDT+HZegA=;
        b=ZTg4FGSxnWH4P4q/u8ecZ2X51Hb9R2wF1dOzgkzVURewlFCndJkimsaAeU2LE+rd7W
         tFEgeYFXMQPWxViHh61cgr4TusYR970ojdniygJt57s3TeHo8jKF0MqfSrTh1pi80vNS
         g7ccmpG0cTpuhiEUrG7vG5qosp6kAfzksOujylCVC1Ht0qSUHAzYrh0ADDA1o2BNXTh3
         myTQ1CD0fFpzVu3Hi78yCdzP0fuxiSHvjW45L11loxFayH18uibzrBieNejUywuSX5g/
         Oi49Hzii0EEXWHiX0eXWjPb2nwuEdorE+WsENxeaVvsYeHzKfGNWSd8KVPOfOrQxLHB5
         a5NQ==
X-Gm-Message-State: AOJu0Yz1KFEojG9/cyvM1MXZ6PKwGcZZ+Vzrhu8wrruYtMcejm0q80+p
	VAEUzPRWEZ8s9zCZGu2v89OizKkgWowBo8YfmldN4J/B8DAO6tmPAf3EVEh4Dag4SpRu8yYcNdo
	=
X-Google-Smtp-Source: AGHT+IFvNstclZFJ+GMtvufzHwKOp04Q7VYBr1q2UKR0p/hdPc/PCSyvSOONd4Fy2aUl44QavCiTpA==
X-Received: by 2002:a05:690c:3810:b0:646:4cd7:76aa with SMTP id 00721157ae682-64c7312ff93mr46151037b3.36.1719786201990;
        Sun, 30 Jun 2024 15:23:21 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-64a9a8037b9sm11311187b3.63.2024.06.30.15.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 15:23:21 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Ziad Elhanafy <ziad.elhanafy@arm.com>,
	Divin Raj <divin.raj@arm.com>
Subject: Re: [PATCH] arm/oeqa: Enable pexpect profiling for testcase debugging
Date: Sun, 30 Jun 2024 18:23:01 -0400
Message-Id: <171978618237.360838.2796500943813501616.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240627125700.2406122-1-peter.hoyes@arm.com>
References: <20240627125700.2406122-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 30 Jun 2024 22:23:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5853


On Thu, 27 Jun 2024 13:57:00 +0100, Peter Hoyes wrote:
> This patch enables logging with timestamps for individual pexpect
> assertions to ease the debugging of failed tests and the tuning of
> timeouts. It measures the execution time of all pexpect calls and logs
> the actual duration for each.
> 
> Only "callable" pexpect calls are timed (e.g. expect, sendline, but not
> before or after).
> 
> [...]

Applied, thanks!

[1/1] arm/oeqa: Enable pexpect profiling for testcase debugging
      commit: 5f647901524c945058a7495a9ff999d191718334

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

