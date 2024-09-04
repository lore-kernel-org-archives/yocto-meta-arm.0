Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB290CD4855
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 15:03:08 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.52582.1725462178629912472
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 Sep 2024 08:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=qcMATMen;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5333b2fbedaso11774707e87.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 04 Sep 2024 08:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725462177; x=1726066977; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y55etIhBXlI3u15lx/BYKHhJ/JbzdFD/m7/Lu2Y2GE4=;
        b=qcMATMenjlQq7UO3PWr7+MrQ1DUCjKV7PmKWczKW5nibTl8lHS+djmwGdaB0xJriqQ
         PiHwTvfzfRlWz7ANyqxkPRYYbzPRUtDMtqsQwKsNLMTGwS2yU2Lq+u/6MKfBkh+F9RW1
         b0SH51BISYS5hYR36pXOnXRG2KOjJ0VRUg0699UiZbdat8QVri3vVX5AaP86QpdYFMhb
         Q5qVZcu9ajFUWHymb4bCy4Q8C8qlHNoPhiPmDEKP6i4lPtgK4DmZ37cwpI12axe6ueff
         AM3CfAm0aO/vCbdDAPgBUCHeSheSDqfdNRmUFl098WFp+AIYzTWMPav9qpTsG2/UE0uj
         M9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725462177; x=1726066977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y55etIhBXlI3u15lx/BYKHhJ/JbzdFD/m7/Lu2Y2GE4=;
        b=IszBjUWSOPx6bmmDVjx4EN8B9xkRLZZC14mIccfxielJie3A6iEosMX992ZISowDPU
         RkzAlVv2eGToeYDb8V29UhaucBDzUSolVQNDMh8ZiVrgWYZNJhMlAbyZ1stMf6H1Swpr
         +zedhtq1jPYwiExxGc9nTkXam5bITOLfTNf/up6CKZKa+DEZ+9dyGK3j4R3OQ4NrYhMD
         deLjIlgqv7DcB4E0so+FaQ76qyFYuCt8erMfBtAsavrvPe4FOagIDIRr97N3wISa//Uu
         uEZKipTI5A/XwCTXG1olf9JM+UDyEW/NuaWO3K8NH6bDxPDh01unmOLPZYbkYMRqILs7
         l4MA==
X-Gm-Message-State: AOJu0YxKdMlxcuaa/lqnqxBoDmfDiaAVbcD0cPwL5WwK7vsUcQ5o4Kwz
	4xmF0P7u/msMBFLvXf6ZqzOxtn/FFHhvUr12Jb0GgDQqpF2Nl5ePy4YMpFuNLgdNMtGT2eGpA9f
	GBow=
X-Google-Smtp-Source: AGHT+IGc4X73PpGUyxEo3T81WK9amaaw+7ZFlQeaEYaT97BCjZ7/DksRhg6eZ+BDbg5z88rHOVfBNQ==
X-Received: by 2002:a05:6512:3352:b0:535:6992:f2c3 with SMTP id 2adb3069b0e04-5356992f3dcmr1157971e87.41.1725462175412;
        Wed, 04 Sep 2024 08:02:55 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53568182fc8sm196842e87.18.2024.09.04.08.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 08:02:54 -0700 (PDT)
Date: Wed, 4 Sep 2024 18:02:52 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: jon.mason@arm.com
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/3] arm/libts: Patch to fix 6.10 kernel
 builds breaks
Message-ID: <Zth2nGkLSl7EOJH8@nuoska>
References: <20240904145538.2538-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904145538.2538-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 Sep 2024 15:03:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6060

Hi,

On Wed, Sep 04, 2024 at 09:55:36AM -0500, Jon Mason via lists.yoctoproject.org wrote:
> The ts-tee driver was upstreamed into the v6.10 kernel.  Remove
> arm-tstee driver package, since the upstream one should be used.
> 
> Parselogs is failing on the qemuarm64-secureboot tests because the
> arm ffs linux kernel driver requires gicv3 to be in the DT and logs an
> error if not (though still appears to work).

I think it would be better to filter out the specific warnings via
meta-arm side ignore list entries in
meta-arm/lib/oeqa/runtime/cases/parselogs-ignores-qemuarm64-secureboot.txt.
File content is the error string which is acceptable for now.

poky/meta/lib/oeqa/runtime/cases/parselogs-ignores-* has examples.

Cheers,

-Mikko

