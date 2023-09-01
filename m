Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDBA4CA0FE6
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 13:43:18 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.6522.1693575789693287309
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 01 Sep 2023 06:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=kCokwsik;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4122e42a76aso12699131cf.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 01 Sep 2023 06:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1693575788; x=1694180588; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDY1pEFB3DUfLYtwNuVIwuZ7QohDUrS7aCXXZjUkg8g=;
        b=kCokwsikyAx/gibQJvDojMxZIkIKZ7JFgIIYvxS20teer8dGFtZmWAnuEil9iGFXjg
         I43GnenjpI4Rh2EIKeRKO2IV/8p5LD8sQMNi5cKAPeY+86SC2jjXqDDBolUG9g42V8RB
         c0JHtC0BoUWjGjO0zVkQ5RKrM3U4mzlsO0nT53Ci8Dtamz+GuRVd6ubjxzE5CDEavEjm
         4HEj9yy6SRDewaDuB+zA84N+j2dOT3EO8nZL4gsyOE69RHTPymNh8kA8vVGr0bgl9djc
         rn3m4uAoXyP4XAnRqYuYPxSgiDkUr7wUYa/fkADQ7g3rp0od1sXdrSGqIzhFlnNrCE+B
         VYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693575788; x=1694180588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fDY1pEFB3DUfLYtwNuVIwuZ7QohDUrS7aCXXZjUkg8g=;
        b=cibxaXfAEZJDCZkOPo5KTDxPHdH4NwOO6btQDB28//pGucuvIgrcKOpLbOXSMPqMEi
         UqBTh2ZYlTK9ci/TuCOOirK+uv+M43/mAkBgVu2PDBKb9/69BtuMaAHYPJfQpyw1YCZV
         qYSIJoSQ53BZVC5TAYXcW1GIERNETAvKO8iY0LSYlTnKzXWbJMMrMXzXkvHj0aqcS/Yw
         sx8EcxlVCbwtFgavvizQAH7vTlm/ZulSbvrJCV49H/Z9vMCJ9xfPQ/qvRDZvq52aVM4k
         DMVlUI18gbgUe0AZxwtNBkUvHOOfCYlfiNFIqsbUW14jcUXYiPEyJz/YX2fwiGGp1Ary
         XTVw==
X-Gm-Message-State: AOJu0Yyld5JXozNEgZpn2T0CJ4flFc/ccUlSMApyVABCjsoIekdmQsHN
	pyIJQGOZMweTXI9jPlXsv9NyGuXLJ+czmwuKZL4=
X-Google-Smtp-Source: AGHT+IFFO0IXSaCpLTKi/JelVS72hn2iJA5xfeqXCUKEKKSIhX33ZzpRLa35z87oClmulx14JQMwMg==
X-Received: by 2002:ac8:5bc3:0:b0:40f:ffd3:61fc with SMTP id b3-20020ac85bc3000000b0040fffd361fcmr3169300qtb.9.1693575788279;
        Fri, 01 Sep 2023 06:43:08 -0700 (PDT)
Received: from localhost ([2605:a601:a697:5800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id v15-20020ac8748f000000b00410ad87b1e0sm1467100qtq.46.2023.09.01.06.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 06:43:07 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/edk2: update to 202305 version
Date: Fri,  1 Sep 2023 09:41:50 -0400
Message-Id: <169357571143.149680.3430884470117245692.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230831170211.3698227-1-jon.mason@arm.com>
References: <20230831170211.3698227-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 01 Sep 2023 13:43:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5013


On Thu, 31 Aug 2023 12:02:11 -0500, Jon Mason wrote:
> edk2-202305 contains a commit which modifies the build
> environment's variables from BUILD_CC to CC, BUILD_CXX to CXX, etc.
> https://github.com/tianocore/edk2/commit/206168e83f0901cbc1815ef5df4ac6598ad9721b
> This causes changes to the recipe to support this change.
> 
> 

Applied, thanks!

[1/1] arm/edk2: update to 202305 version
      commit: 85b11ed55bb0fc2a9080d513ab03df451a4a750f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

