Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E5CCAC583
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 13:34:01 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.17910.1757511234887684305
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Sep 2025 06:33:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=PPUkGhMi;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.51, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-722d5d8fa11so57772336d6.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 10 Sep 2025 06:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1757511234; x=1758116034; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0OoFoxJxKQblaH1APjiL+F16I0IQcPHLMFDGELiP0wU=;
        b=PPUkGhMih3JpKEZHCNgGyLCrr6qXL6hYmkVlgTCwpC5+8Z2esSRtodMxe+HD5PFJbB
         w3JiAFNc+50xwOqDOJtEQ6NBzau9QXKUMG8wWEJ3+AoC1haOa5189llAhlaLH8BZD4C9
         ZK0NS48nqMVrfaXYkO9Nn6lCk/Vaxbjf7T9ifl9ogwIPCLAWcllRzRGZiiLWFOCxXaPk
         BcWS2M9kwRB1ZnJ60VJ62EDssOPw/hN/yEncvbOrmnhwa9krjbPOTJ7B8pCshJ5h40Nc
         4N7Il5RcnbcHiG6yE5u+WGdZUB46J9u1zX6sjfTvKo3bz7OKzD09eF0eOlnx1lqfc5q9
         nNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757511234; x=1758116034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0OoFoxJxKQblaH1APjiL+F16I0IQcPHLMFDGELiP0wU=;
        b=TRElQYfFXC8FNIN+onkBjhSG1Aiy58jCKVudCQrrNoY+OD6EXksHDXmJ0IgCley4Bv
         0/YY/fyghdYbYiuJwF++sIKOPk4P0akzsdHwT9yQtoqCultJt0gz2m/qhXakZxnYw78o
         OKtXS0++d4RJZlvYBFg9671yYSCWcEuXOp4/AtVoLsxasCqLUwmlCDwgBwm8IHn1MLH8
         +HAmyyFJWQaIwvJhmcKfCmHwMRYmrdk7ndY6NeUuHnwOfggat08US1sxCDuecSrpmmqA
         HwMjKcOH4iBIQWuFTBEt0dgx4nDswhv06SANxxs4oLGhpy98S0GuDQf7NWhDqhuiwmex
         Mg+w==
X-Gm-Message-State: AOJu0Yxevey7syLoQzgI4HMwDJbTUt67Xb/Jn87p6O7Qzz8Yl45AYqrv
	aA3/PNbJFNFHahLVyMUzBhDcaKZWflxckAkSdu3wbs1/OPoR/ATw8b9R/FINlvzS8aQFtEEKDUP
	8FNQ=
X-Gm-Gg: ASbGnct79e7mrjgH43zT3Jq4DS1RB7/d9233y4ActcyJbLFE9gMtyiRD7hj5uaoKRFS
	uvrMDPSs8wjRn1cufDk4Vbf8JUzC7ptosr9F7yItVO5VG/u5DoinmDACvzxv3JBILiNYIk+famI
	rYfGIceeKTpeqAeTL4xiClVvyljkS1pN6vFfG5KlmEcoCstTIONRr7ChOWcnvAgkx2jEP/dIM2n
	IxKEA1hEYQWmYdCDkAUcqyCvzayHbErz/WfxmcpZakOfNsrwB40aREYTyVor44sULEphCIjYES8
	+x91/bSVc+agQJglFjv0Kba92cWYlTBLJ9FG2uBZKfAda5/qtLxWfYgZ1ZJW8MsfUFDWiEixUPT
	9zmebpvwM5f3cEQ==
X-Google-Smtp-Source: AGHT+IExikXulAdcUiQLhputaL/Yc15B6aPk8verr68E0t/mdn9Q5jVcyCcp98PdmuG+4bILkfamiQ==
X-Received: by 2002:ad4:576e:0:b0:721:4e85:c866 with SMTP id 6a1803df08f44-73921b438d4mr148697006d6.24.1757511233582;
        Wed, 10 Sep 2025 06:33:53 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-75856b44ac5sm22579886d6.2.2025.09.10.06.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 06:33:53 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/2] CI: move network test skips to fvp.yml
Date: Wed, 10 Sep 2025 09:33:43 -0400
Message-Id: <175751122382.1941300.13385809535908468078.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250904171050.2370998-1-ross.burton@arm.com>
References: <20250904171050.2370998-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 10 Sep 2025 13:34:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6700


On Thu, 04 Sep 2025 18:10:49 +0100, Ross Burton wrote:
> testimage.yml was skipping the opkg tests, but we also need to skip the
> dnf tests for when PACKAGE_CLASSES="package_rpm".
> 
> These skips are FVP-specific as they are due to the wrong IP being used
> by the test suite. This should be fixed in the FVP test harness, but
> for now move the exclusions into fvp.yml so they're isolated.
> 
> [...]

Applied, thanks!

[1/2] CI: move network test skips to fvp.yml
      commit: 5fae879140b367420f6bc25a0ec190c97dd8beb4
[2/2] CI: align with Poky
      commit: 7d60c67ad71a29ade0cd9f16a78ba1993727094a

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

