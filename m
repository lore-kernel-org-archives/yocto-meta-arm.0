Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6693C433EF
	for <webhook@archiver.kernel.org>; Sat, 29 Jan 2022 04:30:50 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web10.2495.1643430649339941219
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 28 Jan 2022 20:30:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=Aenkv8GR;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.48,
 mailfrom: jdmason@kudzu.us)
Received: by mail-io1-f48.google.com with SMTP id r144so10196524iod.9
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 28 Jan 2022 20:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o0RHb2TONdzYp8NskyVaYnq73KksrHAtSIdFz17M32c=;
        b=Aenkv8GRi0HzGo9oT/1cVgQvuQlbFY+eOvkhPRjDX/RxJ3DSWd1tZD/zTShPmNrUkE
         eSavH/Jp4evh9J+fLct1iszeQFh/K2S2ifmtpAZCiZwECRfh4/h/bOZsLi/C3h9Ehj0E
         4o1VJDzMbXC37aUsUZsQO2AT0smFs9ZfQf9QA07O/XsV1oS7Y2pljBIcbXhOdj6c9SBo
         +apoKZvNRG43k++McuuGJ9yEFVWLU3cZ9P91/Due1wQNcBmO3Yd3rTPtEDiG4OhI5hbA
         ctONxJcbHM7u6pb2WpeZoNpvQScNn9tdTaeMn1yzEV1eIwUPP8FJLvaas5HaiuyAHXX3
         anJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o0RHb2TONdzYp8NskyVaYnq73KksrHAtSIdFz17M32c=;
        b=qzjvjeOaHFh0yRqb9aR57OD7qjlCobz7n9jMdU7Zk46xVhvEE1YBRgRoqDruxKBEfb
         ONpjn8crCSaIowcqgUuz8PRanaHDkaoJzCkKhfQuYteUE4iloTos7M1yPLgBZI2vrUvz
         lQ3rGLm4htWcx1eoOo6RUXVpIVjN44CvyoXSqqNyhkk5woSTIjSDiOUpe4yHWEy3CCa3
         IkQpQuuOfc0yhjZIsMKGzkjrWtljUlG2qi0Zg/lgx8LXJxrTA4OAGhfnkD4sNZXQaD+b
         Q4L07PbKX4Gr4WjMfgs7f8SO+Tdm0Z1BCeqpgkEat+sMMjgB3Ui6GxZ3p7XAwcKtIcic
         LFvA==
X-Gm-Message-State: AOAM530rswchPdo+G7D8AuPJjTtsWB9zVN0Wid4wJSzO+Thp2JbuziaO
	ZiilP2/S4OjuHsfVJ5id2uKvSYwaLhYw5Q==
X-Google-Smtp-Source: 
 ABdhPJzcPGljIK/Cp8NbyekSsQ6I6MyS8Pq7jMDbYxk20+wW4f8oghO5JHuZpdyLl2jx9HkcbNtuNQ==
X-Received: by 2002:a05:6638:3283:: with SMTP id
 f3mr4414393jav.172.1643430647469;
        Fri, 28 Jan 2022 20:30:47 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:be14:e8d7:55dd:a892])
        by smtp.gmail.com with ESMTPSA id
 i6sm3142638ilk.77.2022.01.28.20.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 20:30:47 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Diego Sueiro <diego.sueiro@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH honister] meta-arm: Make generic-arm64 kernel cfg based on
 linux-yocto standard kernel type
Date: Fri, 28 Jan 2022 23:30:42 -0500
Message-Id: <164343064298.3410352.13704350537917894233.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: 
 <6002a6eedfdc1c2681e8dc34c2bf35bec8b7178e.1643218652.git.diego.sueiro@arm.com>
References: 
 <6002a6eedfdc1c2681e8dc34c2bf35bec8b7178e.1643218652.git.diego.sueiro@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 29 Jan 2022 04:30:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2933

On Thu, 27 Jan 2022 17:30:23 +0000, Diego Sueiro wrote:
> By having the generic-arm64 machine using the same kernel config as the
> linux-yocto standard kernel type, application layers can rely on the same base
> configuration, independently of the target machine.
> 
> Also, the kernel-yocto.bbclass searches for .scc files in the FILESEXTRAPATHS.
> Hence, we don't need to list generic-arm64-standard.scc in the SRC_URI.

Applied, thanks!

[1/1] meta-arm: Make generic-arm64 kernel cfg based on linux-yocto standard kernel type
      commit: 9653e905bdf05ac30d15fe81ebf71536d745e2c3

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

