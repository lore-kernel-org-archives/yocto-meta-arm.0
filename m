Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD03C636CC
	for <webhook@archiver.kernel.org>; Sun,  5 Feb 2023 10:00:36 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.25975.1675591228783675161
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 05 Feb 2023 02:00:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=kJGihoWD;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id w3so10027005qts.7
        for <meta-arm@lists.yoctoproject.org>; Sun, 05 Feb 2023 02:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f3Kumn5xFcqFrxrGIiWO3ySX30vnfZM2X6jzy+04Dp0=;
        b=kJGihoWD1cxgieFos57jCqGcQaV0WE+gFwSRiuAyDSochFF0awxIzMsQlcg+cnuLFp
         nHn6C9EIa78imgz7ELwmwKQ75xmnJt6sdYGw0a9JKgCkbQJ7+OuUl1NVqKR9iG3vV0zg
         PImOh535ZgPC6A6ZuMlPcPWDe+hLpempsIgp5ph2u2vDWTySn1CyW7xFHzkG5hRZY1kg
         QSynlyqMk2uc2OO7tUVrPycooO0EFcI69GsuO3AAFAPd+hw5Iqf+WdPxYjIFfvvyhUXn
         nU+zDeLj5ssPIXc2cWUyYPmDy/h51EAIWOTE/SeKLa10yS2CVSNdwacEQbbjV4iawbba
         jFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3Kumn5xFcqFrxrGIiWO3ySX30vnfZM2X6jzy+04Dp0=;
        b=PAb/Ft9+D9HCd6IJCDmpqndYtGm/mzGQiO2GW3iHV9SaVQ2ajMm9mcS/nZc5roK2Jk
         OTngA3F1VpGW3EdsVKH/sFBYIvwTvUVue9hgDVqzmoWCxHI5oVyE9NmQPeLBKq+Ht0qx
         Y+DMw8FNJSRkwVnzt3JiqG1c9LCdJtPk0mtMXON0hIEPEvJPxp/43E2TU/h4hAsHQYfn
         kGEh0i90f9CAPBD99ZhpVj8lFby7H4KUqXFleytT1YjIjK+X8xWMgBs6z2dlbocoRsBQ
         GYgJuszjAGs2B8sigvb1wOBsbKtLxwo308IXsrhFd2ipimAgiEt+w5lX7d99vD7Txv9N
         OM1A==
X-Gm-Message-State: AO0yUKXg2bkMwLbXCOLqmr7vf94PwxUPRKag4OZhHDw6Z7m/Q8S2rmqO
	0qyymf6Tx02SerqKFhCJ7W9zOV9GxO1Ep4hw6Zg=
X-Google-Smtp-Source: AK7set/FluUc8DPgRiZJWo9NfQ8micpvLNW/4Dl4uHsLQKfI4y+6niaGXnLMbMCy4PjV73ehVijMZQ==
X-Received: by 2002:a05:622a:512:b0:3b9:a51f:8988 with SMTP id l18-20020a05622a051200b003b9a51f8988mr29319614qtx.31.1675591227524;
        Sun, 05 Feb 2023 02:00:27 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id d20-20020a05620a159400b0072ad54e36b2sm5300807qkk.93.2023.02.05.02.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 02:00:27 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH] sbsa: Fix build with gcc13
Date: Sun,  5 Feb 2023 05:00:18 -0500
Message-Id: <167559121905.1756899.16897318975731342639.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230203014859.701575-1-raj.khem@gmail.com>
References: <20230203014859.701575-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 05 Feb 2023 10:00:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4364

On Thu, 2 Feb 2023 17:48:59 -0800, Khem Raj wrote:
> 


Applied, thanks!

[1/1] sbsa: Fix build with gcc13
      commit: 70fbe7fe1286b47122fd2b4e715c46cd0b2d1a23

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

