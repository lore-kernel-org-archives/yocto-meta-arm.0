Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF56C77B7C
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 00:52:05 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.1802.1684975918998484207
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 24 May 2023 17:51:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=QoyJ4rWq;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-75b04e897a5so45408085a.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 24 May 2023 17:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1684975917; x=1687567917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9p4FCLyQMXra8Jx6aOV7NkjYTGI2Lf+OfdRxp5yhucY=;
        b=QoyJ4rWqDYAqvqYM9tM0HPa5jA2jt6JhGwdR7ZIs0FSXCF4q8gVgklHxjXzgRimScl
         kIGFKkZ4ThdQnRtYkeVbputr9S8xIhhqTIx592wSih5SA3u4DFFtRkKHZ1YWpOZGv9PS
         fePK7UFiaYp3CishzvrSMkIGnST9KLuCZax82AsiTLKwDRkpgZMYZ9ji9hLgbXapLgVg
         7V8MxMQK1dfXSPFF3ZZb8O5okx8LgdbdgJJQdKNHwEyUIq6a2RuRerpqeUCMv576PT0w
         uzcmxpL1/Y8HiRkEZXc790hTx84qyHHrP4p5O8XFm218mIFZpagu1V60c8FVFwXYP5H0
         VO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684975917; x=1687567917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9p4FCLyQMXra8Jx6aOV7NkjYTGI2Lf+OfdRxp5yhucY=;
        b=CCE9zJoc6iS2WQfwS4qR+MvE6VUcAwpGK8Z8N5Jd78zSvK17bvdOC0sNAC5djpUesM
         xYUrGqAiHYqOLQWxW3t0elB2uaTyNLgeXIoDxsweXaAvUUklzp0SLvvkIOwt8gxKPonk
         K+iofHMby46SQwwmVCNabb8mrW7uOk7050Y3oLxExDJa1FgtcGX5O0cLbzIQ1M6d2IC8
         fCLjMYQxm1JqQxPESIiI2MXBEbXVtRr6nO6BbyVVlWKKqgpjQ8VdPVb0DLOvSLY91+Bp
         DJfY93x6fHYALy9qxp2+BH01mhSItWYfGOXdr8qhZlyPAZ1V1i0QdCz4q5GugvpaBLte
         kUuQ==
X-Gm-Message-State: AC+VfDyWVx1lahoEwBAyfVjIgd2UFusIf7Cq19merjW0TuikadmDkVJB
	CUh7+G9j0QZK+s08x9iAtfwrhNsZqlZnq61LwWw=
X-Google-Smtp-Source: ACHHUZ4Q1i/qTgWfP84nsqIzAv8QG8Vuv0sKA7Fs+tZ5BkXHuVexC7+IaQs5IH1nzrh9EiJdWftX5A==
X-Received: by 2002:a05:620a:8d09:b0:75b:23a1:3604 with SMTP id rb9-20020a05620a8d0900b0075b23a13604mr8037002qkn.21.1684975917677;
        Wed, 24 May 2023 17:51:57 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id v15-20020ae9e30f000000b007594229600csm5878qkf.81.2023.05.24.17.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 17:51:57 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: Re: [PATCH v2 1/2] arm/lib: pass the PATH to fvp runner
Date: Wed, 24 May 2023 20:51:35 -0400
Message-Id: <168497589902.1985833.14217575051592123959.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230406152908.224075-1-peron.clem@gmail.com>
References: <20230406152908.224075-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 25 May 2023 00:52:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4696

On Thu, 6 Apr 2023 17:29:07 +0200, Clément Péron wrote:
> When running an FVP machine the model executable need to be found
> in the PATH environement.
> 
> At the moment the script doesn't provide any PATH to the subprocess.
> 
> Add PATH to the allowed environement variable to be forwaded.

Applied, thanks!

[1/2] arm/lib: pass the PATH to fvp runner
      commit: fa598021fb387e98bdb80861f245cc15acde4ca5
[2/2] scripts/runfvp: Fix KeyError exception when there is no FVP_CONSOLE provided
      commit: 316e02c0f13b473e916cd779e59f0d55d48e4962

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

