Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.14946.1595321749944978795
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Jul 2020 01:55:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cYBAdUGh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id f18so2061561wml.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 21 Jul 2020 01:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=usIGjOYoXDqFBrWFYzJNhGpsqIXRmrEwTlLxttJISOs=;
        b=cYBAdUGhFHB4Za1Iloq/SGgFk5tB4kgqPvItZi6/aE6eIW/BXnntFWRBEXU3gMG70Z
         edQvW04LL2+N/kIcZZKZtghn5ncy4jgrQmWeqgWieitkLG702OK/8DIUaT7tOBra1+W5
         d3GtjEKmhKfq4WmfJapgCNxPVbWmSBJUUqIgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=usIGjOYoXDqFBrWFYzJNhGpsqIXRmrEwTlLxttJISOs=;
        b=n+L7juiDT/w6nl3VtCMWRk0V9LhvCbOrt2SwMCmnBgGl4QLvjMrsYpXh4lNI78V7Zu
         1FzIW9IyPQmTtWPOaTVIXnkoeO9ltzyp3dZ+O2oT6xhD9taYRVYqDV/SDHIKC8exlw6f
         sIVxADnuuqqhI7OSj5d9/duixWOZVuKquvYsTelrHQ8IThxvVa9YQCMhdmzjqYANHqAC
         klNmc9y/NCto2+GJ/cSoOwIN6EkyhrLNi9bcKJK7ilz/PdLibNUT8f9bsAQizBerAQVI
         0LxypGnd0l9jRFPRRBfpRHVK+5NFAz5jbc4e2iRR+1nNmHl/M6tjFKgGMElEz95nYHLm
         fmWA==
X-Gm-Message-State: AOAM5306r4cvGGKcbx0Q4zIsiU5bFTmiWfb7lhn03tDRn/6szIfpGn/7
	IxECepFZtqyAUmioL8oXmTn83g==
X-Google-Smtp-Source: ABdhPJwkE9asBYH1bFo2T67yI4vPbkGsgzFW/VatxaiXJkHkP7LYcx4cr9vOsltMCCHbQ1qSP0YbLw==
X-Received: by 2002:a7b:c0da:: with SMTP id s26mr2857680wmh.96.1595321748480;
        Tue, 21 Jul 2020 01:55:48 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 6.d.c.a.e.4.9.c.8.4.4.2.b.1.8.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (6.d.c.a.e.4.9.c.8.4.4.2.b.1.8.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:181b:2448:c94e:acd6])
        by smtp.gmail.com with ESMTPSA id 31sm16482718wrp.87.2020.07.21.01.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 01:55:47 -0700 (PDT)
Message-ID: <1233345f41b84cc472f7dc940bf74f5dd54b9eb7.camel@linuxfoundation.org>
Subject: Re: [meta-arm] [PATCH] arm-bsp: u-boot error fixing and file clean-up
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jon Mason <jon.mason@arm.com>, meta-arm@lists.yoctoproject.org
Cc: nd@arm.com, Damodar Santhapuri <damodar.santhapuri@arm.com>
Date: Tue, 21 Jul 2020 09:55:47 +0100
In-Reply-To: <20200720181735.21132-1-jon.mason@arm.com>
References: <20200720181735.21132-1-jon.mason@arm.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-07-20 at 14:17 -0400, Jon Mason wrote:
> This commit fixes the errors while rebasing u-boot src to v2020.07.
> Additional work necessary to preserve dunfell functionality.
> Consolidate all of the files into a single inc file and single
> bbappend
> file.
> 
> Change-Id: I442c843b1fafeb41ea283d2f11393522a48fc9d2
> Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
> Signed-off-by: Jon Mason <jon.mason@arm.com>

Thanks, looking forward to green builds!

Cheers,

Richard

