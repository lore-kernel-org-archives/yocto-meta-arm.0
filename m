Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7697C4332F
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 14:13:04 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.13951.1671199981138932537
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 16 Dec 2022 06:13:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=oQAcWwCH;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id bw27so610520qtb.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 16 Dec 2022 06:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v9uWHF3nCmMZltG1RXh7mkYVdsb2ylq5RsAi07Tj9aE=;
        b=oQAcWwCHt/0vKS1lVvVtbfVxuhH5DpvBL0n9jkVpPv+qB5KXmaGBMYG/wFaD5nDDwB
         ihasZBUy8guMPgeXAl+7FWPW7MFtP4wGTLjW2ga1rdcqB/XVicY7WT60Xl1JqmNOt9Fq
         Q6iLkGkPEnfggPxZTOmCvIlG1wDjOcqwEGqsLoc4VgOJk4+65Q9kbh7evoIId9xXbTR0
         B1L2adVoPVukOCsZxX5tM9je4D9K4/fB+1Jk3cnqs30mMdCna8JY/8E8IyYQl0yvLfzt
         n8Bc0PEsUAcVVW/vJwxF8obigmPyc6Y5S4fTGsR+Bl5sJsStACj1QgAl0U+gTWQ4+79b
         MTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v9uWHF3nCmMZltG1RXh7mkYVdsb2ylq5RsAi07Tj9aE=;
        b=fT/Ah49J/NOZs7yINb+gqWBWNQB2RLzrH+A0ju2ZRfZ4MWq8k4xZsLak5BdDj6CDTW
         vytsTcXrupzjvC93NaXwCGbM9QfQYM3AIdVuWH7qZN4jC3HAiNKkE7Pt121TjtY1zxVg
         yyKgoOU2bvrpPbXvfkJCrfXvKyCT62SwB9WlX0pWveypej7APU1lgYjI2/yhEJ+sFq/O
         47uTaEmdhP041OejYU7cQYCO9WdMnjje3O+k5G3pSUNgYFQlLAJTUL3cqcO537uUlD77
         eD0Zcldv4TXouyKaFgTlXx9ygPbJdOcqa+19faHmeMTkkn5YHtbl0nhxn4O/kG+0bv3S
         nEEQ==
X-Gm-Message-State: ANoB5plkoG85dGDLzcUm3kQxjLDnF4z2k18y32T2/pZAxbQ5Q3jGM96v
	gwGt6A5CfTRyACojO7+wIiUH9mRXqQxv7Sos
X-Google-Smtp-Source: AA0mqf5Iu6Nn8Ryot3f4e4vKR5oWC6Di9TebjYyMzRz9wbDLEfmdqv5dqPsl56NjR/nhSoDHXQXS9A==
X-Received: by 2002:a05:622a:144:b0:3a5:361f:9819 with SMTP id v4-20020a05622a014400b003a5361f9819mr58114401qtw.18.1671199979751;
        Fri, 16 Dec 2022 06:12:59 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000:24f9:d5b6:38a7:110])
        by smtp.gmail.com with ESMTPSA id l1-20020ac81481000000b003a5c60686b0sm1378594qtj.22.2022.12.16.06.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 06:12:59 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH v2] CI: define DEFAULT_TAG and CPU_REQUEST
Date: Fri, 16 Dec 2022 09:12:46 -0500
Message-Id: <167119996616.2686849.16829489486349698128.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221215152415.6537-1-jon.mason@arm.com>
References: <20221215152415.6537-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 16 Dec 2022 14:13:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4199

On Thu, 15 Dec 2022 10:24:15 -0500, Jon Mason wrote:
> DEFAULT_TAG and CPU_REQUEST are being used to help with internal Gitlab
> pipeline setups know which type of machines to run on, but has no value
> outside of Arm Corp.  Gitlab CI allows for variables to be overridden
> by default.  So, we can give it a default value of NULL/empty and have
> everything work internally and externally by default.

Applied, thanks!

[1/1] CI: define DEFAULT_TAG and CPU_REQUEST
      commit: c32c4043ff6fade1ec96ce1381512fbf7ce771e5

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

