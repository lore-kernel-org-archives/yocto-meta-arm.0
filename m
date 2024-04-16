Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9340EC4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 02:18:45 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.10666.1713233920528914409
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 19:18:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Exn4vdtf;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-78d57b9f3caso246487885a.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 15 Apr 2024 19:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1713233919; x=1713838719; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t24JqwqFIN7Qt63kiR0BbryY61Ae2q2oX9iAUYsz/CU=;
        b=Exn4vdtfLYmmpA9bnSRcTAC3LcJOohu8pJziyjgKgzwysPh2gp5ErrcV8Kl4Z7X1Uk
         fJXm4vkZmCipXJpbhKe2lcGJM2PAVlZCzPouJjNp3epoqTz8Kpeaxalo0AFzkkhBnvXp
         kGliYoEpJmePKZHKVHJkyJEkt9dcnN7Axcg3odflqXLeZ7rsI3nD0YfCiWQPnJXWWe91
         tY1eZmWGtajGjHN97PuPkv7/48mKbuXibp6WYItiBLRj3TL2PVEwXuUF02ZcjLshGBnu
         d3s9w34YRtqAVAPRRECKqOxJ/4fJdSROWwPgOWDOWo6MiRg6MZ2tQlzZrBKmO17a/yRW
         jiOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713233919; x=1713838719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t24JqwqFIN7Qt63kiR0BbryY61Ae2q2oX9iAUYsz/CU=;
        b=FGOsdLZ72NYQaVx7UA98QXuHr//kIdke6wB2NxJRDv7akX4IzNIrKEMFWKlmURoEk5
         /ze988UJXjqmwB/TYscVvMpnK3syxOdmxFWmAgwbK0WvG2J+CYNPSDggLhZBAYGn9B3e
         tQu1x+J1tq+zKW+7YVx5iXU7mi5wPwOCiIbHofnaDZDq3fgRHFhOhxNoREbJnrQqzqHr
         z7eHAlJNbVCB05m6mBEaVaLs2zcedodhgPPdC2PqwaG1FEstYzq5UrXOGbF49eF1XZGn
         /skDA87Ue1uYi44+BNEVlaZaF1V/M5IErP+6xM8Pe41Dzxz3ur/wANarMTRkHB6iQfht
         PIbg==
X-Gm-Message-State: AOJu0YwzgS/7VvQ5Xt7AfvyWhKqfDusyYWD3xJ3sHcgzQsfPb9VrsMAW
	WC2s3eTYPVFRi8dcedIBDJG4ua0+Hwa8/Rz9gwMAb88yaoiTu8cDqiO3loWR8lUb1AIT9+Rc9NE
	=
X-Google-Smtp-Source: AGHT+IGn7Hjjd2fK+BpeW1uKb8aHFFMCl4FS1cvB5WOImJUg+kN00UICtNd3YTn0SBKLgqkxsAYaUQ==
X-Received: by 2002:a05:620a:5754:b0:78d:52e6:5136 with SMTP id wj20-20020a05620a575400b0078d52e65136mr12916786qkn.51.1713233919439;
        Mon, 15 Apr 2024 19:18:39 -0700 (PDT)
Received: from localhost ([2605:a601:919e:c800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id vr12-20020a05620a55ac00b0078d66d66d82sm7124159qkn.30.2024.04.15.19.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 19:18:39 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH] arm-bsp/fvp-base: improve FVP performance
Date: Mon, 15 Apr 2024 22:17:58 -0400
Message-Id: <171323387901.3101369.12454584140224048147.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240415150735.3443599-1-ross.burton@arm.com>
References: <20240415150735.3443599-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Apr 2024 02:18:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5547


On Mon, 15 Apr 2024 15:07:35 +0000, Ross Burton wrote:
> Increase the number of TLB entries from 0x80 to 0x400 and disable the
> checking of memory attributes.  In our CI, this makes testimage run in
> 576s instead of 803s.
> 
> 

Applied, thanks!

[1/1] arm-bsp/fvp-base: improve FVP performance
      commit: 04187be11dc4bfc898d411c1a40c2a1e9f4ff925

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

