Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0453AC3DA59
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 09:49:34 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.15449.1721382565747442609
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 19 Jul 2024 02:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=An5P6X0m;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52ea5765e75so1883326e87.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 19 Jul 2024 02:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721382564; x=1721987364; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8TpNk2NoZleJerYh/XQxylO6Q958INUFlJ7km5PpTeY=;
        b=An5P6X0m4tZPbCGKcs4hxQ/0BXVbBfDoDt+M5KPioFNiEA6Eib8im92R0rJpVdnH1h
         r+LAYkjOq6tMi4m5i01RABBQ4fsBTGDvSWMLOrDwLOg3a2riPhHTWEVGivc+orp0L6dQ
         GGCfL2X5pyLrA1SvACqQ2ejwhHpKgFPISVLue3YJ0xX/BPCc099Ek3/RG0WdfGDEYbB0
         9NpYDysZ0WkmRd+ecAF28Bvwc4NWL6YpiUXgN4JHJa05sDquMhTedSOzdKI+vooGeL6s
         1b/DL1Tzl0r61f6VkGQvFDVlwACU82i711C+CfAUWcY9Dnz6GD54tWdPWWi7ghkfkxGm
         89GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721382564; x=1721987364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8TpNk2NoZleJerYh/XQxylO6Q958INUFlJ7km5PpTeY=;
        b=cVZI60Zy5bgbLaQDFccntmoppoSHXi0UP+FxkDxTJrNguOSnbuqZEoDLLXG1qC/1W8
         jV8LzovUSJTdVIwV9qMFJMRACdKv52MJd6t6G4b522cIZzR2/98/WLTU7iK4fpbdterD
         0HKuD+ZBY5T5R5EQhmI+X0u9AkjDTj/gs8bHQWNaePt9bAlzj44GBzcona6Q/dePiaAz
         QYaYMGu0iUHJOQ+180B5udtyplaD8nght1/uHdtXE+Goph1JY2ZLv2IbcO2GPPKnQ9NA
         yBVfNjtgkoq24zifjf356q7jMU7qhh2oUBUbbLFjy5qJ/Rdbsrc5I+bB06yWMyOXkKbE
         6DOg==
X-Gm-Message-State: AOJu0YyJlv4/7CIUeazYWdu4ApR48ms5o1BIDUSYrT0TmA9maow5fGxC
	FG/IwNF51DAqLZo/jF+zk1IwayQGk0E97nvyth/p6fNZWImA7DRjiFj6MJDfOeQ=
X-Google-Smtp-Source: AGHT+IFCZyGX+mQAsAchbbIDUySQ0wZP3lB9/XmWQFP1TOLPZ99rgPH4wr5canG9C3IQnge6/1jIVg==
X-Received: by 2002:a05:6512:1591:b0:52e:bf53:1c2b with SMTP id 2adb3069b0e04-52ee539c1d3mr5222831e87.12.1721382563842;
        Fri, 19 Jul 2024 02:49:23 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ef5572585sm141926e87.234.2024.07.19.02.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 02:49:23 -0700 (PDT)
Date: Fri, 19 Jul 2024 12:49:21 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Javier Tia <javier.tia@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Ross Burton <Ross.Burton@arm.com>
Subject: Re: [PATCH v1 0/7] qemuarm64-secureboot: Enable UEFI Secure Boot
Message-ID: <Zpo2oSWitdFBuC2L@nuoska>
References: <20240718203526.52214-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240718203526.52214-1-javier.tia@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 19 Jul 2024 09:49:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5912

Hi,

Is there some way to test this in oeqa runtime with ssh that
the boot was really done with secure binaries?

I think this is quite brittle and test should verify that
boot was secure.

Cheers,

-Mikko

