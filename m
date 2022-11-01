Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC0CFA373D
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 12:46:10 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.5918.1667306766125858319
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Nov 2022 05:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=KigvypnM;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f178.google.com with SMTP id h21so4166426qtu.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 01 Nov 2022 05:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WJEKcrw1cNALNYAh7CdiTrSHTb7VbBasSXUSJC6gjyY=;
        b=KigvypnMw3C/i4PLjc647b38G8zoGYIwUQA98iDLl3sji8DZ+RaCYNLYvbeIDfEyR+
         RWivVQfnwEHwrB6h6VKbJAK0zoBnUFdmnja3+UGm9IgEF9PbSuX87rQd0ddl7v2srakC
         /D8EcPkgvFpLoJiTit6+7vtUMVXBZDIkWepI3OCvzu+fQoOm5fHrSOnnzsbF7KiZCKcU
         phadppptdmRPbQoBP92UVwqpW0D39y/1l5PxxatMN6/l3NZCgmjcfuCOlwNln1vDcGFG
         AkyeAb8bESh7CWr9GCWfTsMUnuYb7qPN8A2/FKhAzBW520cuKswFhO9XRqkWfsGgLbnA
         sfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJEKcrw1cNALNYAh7CdiTrSHTb7VbBasSXUSJC6gjyY=;
        b=T5oAs3pmNk+dCY+KBfiHqujuhS0MROqoMcjPM6sPGxrCkn6WRmcuONfcBHi0vUHxlv
         k30BbX7SmdatMG715HcI9c8GfKdGyumNiQtVayuivLizZAvmjBPaoDbSdfDuHSaPzLJN
         Ory5kmOsavjU2ZbLf+wWLvl2DQAdrRtQYaaQfF1i8be3Da7gBCQawDDJwpqJc8Wh9+6O
         puF7o5JeXcJyW3T0aO7j46dWqJs2SuKimYaoaFpZCpPOspb4jBa3ROL0+sOVwsaHy7XS
         uhjTYzQwyVy2xvZH8xfnOPUCxZSFSCcewa01pV8vTcWlr2nlwcGYMbnpI+9kipypfpfU
         IfJg==
X-Gm-Message-State: ACrzQf37GyrldWvMUc6f+5G9gejNHH8YC2Jt18L0FnHhycQS+IrYewWf
	HA1F1hZNWIWlFrqnYS7AC5xap0yhBELBZw==
X-Google-Smtp-Source: AMsMyM5N/HNI3VZniLU1sXUvv1BLwC3v1VpqvN1GlpP8KLPpIktrOvcS1u0afTr2yaADUHwzJMsUhg==
X-Received: by 2002:a05:622a:1f05:b0:3a5:2e13:bd82 with SMTP id ca5-20020a05622a1f0500b003a52e13bd82mr105063qtb.480.1667306764814;
        Tue, 01 Nov 2022 05:46:04 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id i22-20020a05620a405600b006cbe3be300esm6707115qko.12.2022.11.01.05.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 05:46:04 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH v2] CI: Add packages for opencsd and gator-daemon to base build
Date: Tue,  1 Nov 2022 08:45:53 -0400
Message-Id: <166730675369.4073097.7004608907241108820.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221031190901.26317-1-jon.mason@arm.com>
References: <20221031190901.26317-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 01 Nov 2022 12:46:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4068

On Mon, 31 Oct 2022 15:09:01 -0400, Jon Mason wrote:
> opencsd and gator-daemon aren't currently being build.  Add them to the
> base build so that they can be verified to at least compile.

Applied, thanks!

[1/1] CI: Add packages for opencsd and gator-daemon to base build
      commit: 49b23ff619eb10521fdb58faae2c4d8a1942909c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

