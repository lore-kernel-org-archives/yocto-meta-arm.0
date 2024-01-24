Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17261C46CD2
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 04:16:36 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web11.15200.1706069787011687973
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Jan 2024 20:16:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=rXUqP/wi;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-429fc7a1eacso45909851cf.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 23 Jan 2024 20:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1706069785; x=1706674585; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DhGyS3rLuPtHCskJ/QMzDSVRmP1ysdMivvhKZbXlb5Y=;
        b=rXUqP/wi6O9KqQ5iwRlRHcJlAyELWu9LiiAmBewGYHQoSjYWiKsuHfLn0L5e5br5ua
         CXbABECu1aU7Onb51l6touZ51lCPuK5FOdsKAWK4CtnaKFXdq2VYz5jfxJuyMcIVRtEJ
         d8xjGTCuRs5BBKWt9iuscT43DlTj1z2Wpn98ZqjHOC4q1ANsbb4MpCG3KA37CKZeYCkA
         4vj3n3gGl3BmR7N/gZN48GCrWx/2EE+X7I2EWItMvcejDI+uXkm0QI1ERZyrFwR7y9t9
         Ne1R8jothcntc5HGUhxLP/UmwRCSXufgq/HN7nSdDnNO++8mc57UMmOfmPz/KztVRHAk
         Bmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706069785; x=1706674585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DhGyS3rLuPtHCskJ/QMzDSVRmP1ysdMivvhKZbXlb5Y=;
        b=gZnSnrIiFeuXumuL/Ff8Lm7hAGFjKHf4SIL7IxH7+qB3zbnzINHPDnqVGqTa2y2JKX
         TdZfFTGz+bUW6KZ34OFV2vtqvvPE3dlsy5kRe0BK410xwaqMnzI1L92kzdI5751br3Hk
         DiwxVF3NveLJ2E2xZIHjW111kMaSxFWj1TV6/F/fji0Q0YoAFVwz1J+OdqOLMqw7Ow2W
         daFcTltfe4zWkZbUHiU9mjUKyGdaD5p+24OJzUGpAGvZKXr0LcaqUyteLc1XSA8/Ky5j
         w3woDVhqL1d5j4sCYpb9Mvr0unjlZkIAEOopWBDl+ELZd9vVaTEi2223pghTBEdgNG4n
         VIjw==
X-Gm-Message-State: AOJu0Yya4pEY57ws1SZB7jLxZWoe3oZw9C4YBcUS7RWpFTJnTxE1130/
	ufmqiGctPFbdDJEYq5qQZSO33oYUYqAF32zNyhjP/w7+8znErH5JSn29ibN18/x6A89FYfu/GNU
	=
X-Google-Smtp-Source: AGHT+IGI/ZO5u6yEEbhPdhpzDEbUXhyepYTS7PH51CsMNa4MsMflX+qqgE0x3TqqwJm1OIRVmQoZdA==
X-Received: by 2002:ac8:7d83:0:b0:42a:45b9:9492 with SMTP id c3-20020ac87d83000000b0042a45b99492mr2351130qtd.19.1706069785153;
        Tue, 23 Jan 2024 20:16:25 -0800 (PST)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id ey22-20020a05622a4c1600b00427ee66bec1sm4084449qtb.48.2024.01.23.20.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 20:16:24 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Subject: Re: [PATCH] arm-bsp/linux-yocto: add 6.1 recipe
Date: Tue, 23 Jan 2024 23:16:13 -0500
Message-Id: <170606977364.1748639.3635001299846490409.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240123135623.45212-1-ross.burton@arm.com>
References: <20240123135623.45212-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 24 Jan 2024 04:16:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5355


On Tue, 23 Jan 2024 13:56:23 +0000, ross.burton@arm.com wrote:
> Linux 6.1 will be removed from oe-core master shortly, so whilst we
> still have BSPs that use it (speifically, n1sdp) carry a 6.1 recipe in
> meta-arm-bsp.
> 
> 

Applied, thanks!

[1/1] arm-bsp/linux-yocto: add 6.1 recipe
      commit: 1ef1b0ab259b770461e7d0680637a7d24582dae5

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

