Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F45C10F16
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 02:08:07 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.3211.1714529285166109180
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 19:08:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=vtA6CMBV;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.173, mailfrom: jdmason@kudzu.us)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-de603e3072dso2789380276.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 19:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1714529284; x=1715134084; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgb533BfO2ktQhi1jKKAMqn6Tt7ncZuVIrACXsbNzY0=;
        b=vtA6CMBVVixnRoyabZXam7Y6O1Q1J1A9BsOdrDVuA+E//AeXLHjtlORzmroLO0PNO+
         iEgjSjpEeYPlLwbdfcmpQPzjIfk8fwhAO2pINqZ3ui8XWJ4sltR+1M7mKcg3hDs35ZDH
         dv+m1BpuKruppb7b+ouUXPugm0Ifvw/CpzKjR+dDSGSzFErrPwIwACjhg3iKWzxFeCQo
         uh+0omFPprprXVpEuLEM7iTUSD/9FP3IokLXPHP/WkH1CSFexUmlYjTlXvOqf6e2FgfA
         SO1u2fkzPkfRRsxj9cI38TH1pIsgwOd1DaLuIutEZ/j3RoCoVdm4FVZgz6LP+ZO/K7az
         GS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714529284; x=1715134084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zgb533BfO2ktQhi1jKKAMqn6Tt7ncZuVIrACXsbNzY0=;
        b=hJCFmC0vOrTAGj1xV5hhxaArA8Z2R4NY9+DNIRWwnHqJY2zZfQKEnMOI8LOrcVbdui
         D39jGTs2Nz2lDTVy0aLEeRKfXU4fQwcJxEpS+woJx91iVlrVlNqDWJuYTl6aK/rkSCMh
         Ju2Rm+iHxzy5UlQICCrMhCluf5oFOvLLtJZqAgVk0UKpq0usV/Z6Ap2+jPG1Ln9MjFmj
         QLmLTpeTvPJMQZcU5QojotfsHRkMkvnWcs1pbCQ86lZU+Z6p+wQbnLE2GeeXdXsvA+CL
         IJeygMlHY9HPeFwH45VzRqRRnf+GOEJJBcMLG8hcms/njVqpwVsyKY2B7x56jK8Gfvny
         dT5A==
X-Gm-Message-State: AOJu0YzxSW22VAC5bsBurkCrD9TYxzi7yKGBvHZXSxpZNXQtxIH1x0PY
	Oa8vuzlEMSheZs1KmHqbIr2vLgq+fseaWOQ3oEI8FpbmrWZEObpXwfe9VhIr/ozxS4+oboRUwNE
	=
X-Google-Smtp-Source: AGHT+IHaEDWagC6EN6zWY4lMXxjMXG9ewLtyVXCv4npAqSpMQ0QQ4x3Az/eKwxYn72xHy+phQnUSMQ==
X-Received: by 2002:a25:b209:0:b0:dcb:fe58:a08b with SMTP id i9-20020a25b209000000b00dcbfe58a08bmr1333431ybj.15.1714529284084;
        Tue, 30 Apr 2024 19:08:04 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id dh3-20020a05622a4e0300b0043c7d293f9fsm311768qtb.67.2024.04.30.19.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 19:08:03 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/2] arm-systemready/arm-systemready-linux-distros: disable buildhistory
Date: Tue, 30 Apr 2024 22:06:58 -0400
Message-Id: <171452921855.3441774.2572425503055363501.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240430124517.1702987-1-ross.burton@arm.com>
References: <20240430124517.1702987-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 May 2024 02:08:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5678


On Tue, 30 Apr 2024 12:45:16 +0000, Ross Burton wrote:
> These recipes look like images but are not constructed the same way,
> specifically there is no WORKDIR/rootfs/ directory. If buildhistory is
> enabled this will cause it to abort, so disable image data collection in
> buildhistory.
> 
> 

Applied, thanks!

[1/2] arm-systemready/arm-systemready-linux-distros: disable buildhistory
      commit: d89d05d9aab225f562f7bc5d4fa1d922a2fda421
[2/2] CI: build arm-systemready distro images
      commit: 8399d913a911eaeb170c6baacccc44fea2ece5a0

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

