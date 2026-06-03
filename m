Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C746CCD6E4A
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 12:52:49 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19146.1780491168624230608
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 05:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20251104.gappssmtp.com header.s=20251104 header.b=GWMUfeY3;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.51, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8ccd1f57b32so79852616d6.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 03 Jun 2026 05:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20251104.gappssmtp.com; s=20251104; t=1780491167; x=1781095967; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wqIZ7U/hA64HADwoRwK2QYpObHwHK9CxBWOMYndS9dw=;
        b=GWMUfeY3L2LycAghyXcQMZfoJe7OodVsDy03fhuZGdNrzxYp+jStZGZ+zl5aIhDvY2
         NDbr6LU/bLXsLgwxEC5om/N7LIPHHaTAFDD0j1Bfri1ippH9ESCY/uiF1sJ2GdbVLsjb
         f1xbaKJNytKEkcAsxctYOvWN7IULQMHgKxausWMIkNajieYrQjdkFqPNQruADqJ2Jez6
         d86TRZu9xHNsWSlsrWrLiH7d+Jvpv69NAlaXaUAfyXryxLsxh5nOCtbO7fJMno0EGD5y
         a5EE9OXl5O6B9MkSORioMnlCjCUtn+dhD4yKYfBMMp1lrtuNT7gzM9LfnJRUCpBRhesP
         aJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491167; x=1781095967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wqIZ7U/hA64HADwoRwK2QYpObHwHK9CxBWOMYndS9dw=;
        b=hvqXqBBmmcgXtgANOCy4aEtXncC8f+I3rIokmiWVYI+iyGBls6jPlKfBLkbLE/593M
         a9kktegMCGO008GGmAG7TQFs+8civehHXffRfQ7MtP6QvoppIEXEoQva6rB7k6ctED3a
         lvo21fbfHJXHNLcKx7yuHclrGbY/BSI8hhsYsEQK4NY8m3oF3UsA9CjYrVVpexVj5TaN
         tDyI/hYDKXbz8ge06OWtDdnxDRzsn2befTOjVMYl0DSPvXXHjPD9zuqGg4RdYoN3TTg7
         6iuTdrQiOhAWtzc+I0mbj8WBgZzcFtNEk7kiia/IA0hsqBbVfkFKzQmckoIa3wu/DA8n
         1Nlw==
X-Gm-Message-State: AOJu0YxLFnvnz9eP9m5M8eX9qF6+Gf3EWlRS9q3h/F1QDJgLZ9W54R6K
	GI49JKp35d4b7INsPB8ANCIdMuUVRudt4dWQ0vYWaZ8Y3E7PdRkfCWF+yKGMiF7ETpvbHOXLwES
	ndJG2CQ==
X-Gm-Gg: Acq92OGoTJMpK7IQyn06ksfKOb0bRJc46VvYHWet4sxK8rdnvZvGni3qTRAlRSW2cXc
	wWVXYiIlkoS74SDaMBPq9PtjrOib9EuveeP0ZFUMFPGVskdj9jrnOlaxf2ZoFd2HKqBkUfEDRjK
	r2wDKYUfC0DUg85HfBI5UZOV6wTrGwBq9rhmaVdecUko2aqiteraETJ3d6WbMRqUibOdhrGbCKY
	oMBkQQucYam8Co2Ss+gwCVvur3+3WjQxDjL8GyKgxl1N7uqS8qxU0Um69qB9Y39mpjyERVxr1gZ
	iD1RrP0Fk9R+cigLJK6Fo8izCubrBu69jsQj+j5CapzwjHieMd/kmPVFQstJKg1lA8CJA0Ph0Fq
	a9a4BAcvu82QvA8i8tOpcIUfugdoLBQ3jkX7pLCibDpmUl8Egi6qugx3reuEGkwRHzrXYXihUlP
	nVEdr5RELW5xAHn/8UbS6/D+g=
X-Received: by 2002:a05:6214:c24:b0:8cc:f882:2564 with SMTP id 6a1803df08f44-8cecdcd2975mr44802966d6.40.1780491167379;
        Wed, 03 Jun 2026 05:52:47 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccd9fda2sm19501056d6.2.2026.06.03.05.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:52:46 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm/tf-a-tests: Workaround GCC errors for 'unused-but-set-variable'
Date: Wed,  3 Jun 2026 08:52:34 -0400
Message-Id: <178049115562.2951988.3597557802638828710.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260602125811.54843-1-jon.mason@arm.com>
References: <20260602125811.54843-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 03 Jun 2026 12:52:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7069


On Tue, 02 Jun 2026 08:58:10 -0400, Jon Mason wrote:
> New GCC is logging errors for unused-but-set-variable in
> tftf/tests/runtime_services/standard_service/psci/api_tests/psci_stat/test_psci_stat.c
> 
> Workaround this by adding -Wno-unused-but-set-variable to the Makefile
> Refer to https://github.com/TrustedFirmware-A/tf-a-tests/issues/4
> For the upstream resolution, if/when that arrives.
> 
> [...]

Applied, thanks!

[1/2] arm/tf-a-tests: Workaround GCC errors for 'unused-but-set-variable'
      commit: f23b86a59cb1901d373a8a9912ec75c030813b83
[2/2] arm/ts-sp-common: Workaround unused-but-set-variable errors
      commit: 02d361b4359fde9b6646129980f1484f7aa5b09e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

