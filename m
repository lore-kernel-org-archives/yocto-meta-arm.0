Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 629B9C10DAA
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 13:46:53 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web10.72425.1701352009507713587
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Nov 2023 05:46:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=w8ZIvCZI;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.210.50, mailfrom: jdmason@kudzu.us)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6ce353df504so535935a34.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 30 Nov 2023 05:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1701352008; x=1701956808; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5uz87crC8r9VRNcqKp1iY3ZNguoxDWY2glVr2Y0n41w=;
        b=w8ZIvCZI2YXAe4sFR9Lv9sHU0l7Y/E+FbYnRNaINNqmAiM/HpkqhjKaN9FPFeVnuC2
         xC5g+lWZql7X9yqT61CsVXwwSymOq0OmecHJdtuphcGnyCcfEZ+Q2buhXsSrY1nHw54N
         IYRYMjxsN2uBvSkror/C4Th2pRLy1BBiBF8lzbwCS0/XZVOfs0qm3CP9ni3ay+OXJ3Q5
         OI/nJfDEjSDVTyg9cwxyQQUmLnuy61decHSIwFk1sExgqy2TXYn2CsgBu7tM2ExPy+kL
         xpizjLIc+2vdkaip0PKE55wckysypz12AvXByl2BfsKOQA3QoZcIvg8qxPUaSK29Tp+4
         V6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701352008; x=1701956808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5uz87crC8r9VRNcqKp1iY3ZNguoxDWY2glVr2Y0n41w=;
        b=jzpjbhIpNPv7Dzi44lqwb/oqBDJqMbXEjIHkn+fh2ErHPQQxaH7k+DaJd4/5hyJffJ
         dxmM2Nac03D79gCmbAVzPZ0HqX7CLJ4f7wzf7Ze20LVp5Sg/32UfzLFKS3Et/yO9T5fo
         IoibaRYiX8FNHluL3Rl1UL+hCEb+1KbWdbIxUi0qTNny7MGHkoSFtWN/nKAnTTpzRX8Z
         KwOBlx893iSg6Hxr+0G7hjsfWFVtdjjGZUKoQzJcMu5jwPbdoHr6ApsaFJlJoTRjmLwy
         WlmiGJ4sVNmxytMD2lpcywzK0YxB53S18CeYvopM2gDoWrnVhisdKQPIruH76Pa13fVe
         hfCg==
X-Gm-Message-State: AOJu0YyDOx4t3RDu6hqPeVFnBkulx6a34NklHTQYAuranr3LH8UbOylR
	oJ1x1nhDQ/sEkV+HjpE6EbO/KiwX58coqLF+2qA=
X-Google-Smtp-Source: AGHT+IGhWcUUz9O3CsXRel7R5DIsmn8y1jJzOrvwIjTM8ZWUUVce1TtKErNrM9Jso2uMfE9IoD1P6Q==
X-Received: by 2002:a05:6870:a9aa:b0:1fa:3dee:ec38 with SMTP id ep42-20020a056870a9aa00b001fa3deeec38mr18401705oab.12.1701352007901;
        Thu, 30 Nov 2023 05:46:47 -0800 (PST)
Received: from localhost ([2605:a601:a688:2c00:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id c15-20020ac8660f000000b00423b8eddc25sm498507qtp.55.2023.11.30.05.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 05:46:47 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH] meta-arm/selftest: add test that PAC/BTI instructions are used
Date: Thu, 30 Nov 2023 08:46:28 -0500
Message-Id: <170135198799.3687548.10128727812732828344.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231128154447.2616762-1-ross.burton@arm.com>
References: <20231128154447.2616762-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 30 Nov 2023 13:46:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5286


On Tue, 28 Nov 2023 15:44:47 +0000, ross.burton@arm.com wrote:
> We enable PAC/BTI out of the box, but all of the pieces (such as gcc and
> glibc) need to support it for the final binary to be protected.
> 
> Add a minimal test recipe to verify that the "Hello, World" binary is
> using PAC/BTI, and add it to oe-selftest.
> 
> 
> [...]

Applied, thanks!

[1/1] meta-arm/selftest: add test that PAC/BTI instructions are used
      commit: 0b61cc659a992e59c157fbf0be6d50919c464613

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

