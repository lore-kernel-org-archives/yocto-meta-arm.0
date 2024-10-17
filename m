Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99DBCD20697
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 08:34:43 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.44482.1729154077354553353
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Oct 2024 01:34:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ImHqs/xl;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539f8490856so791372e87.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 17 Oct 2024 01:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729154075; x=1729758875; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zQ6DquZoc8pmgKL4myhwmN2reKV7rSzKiLlYiYUrabM=;
        b=ImHqs/xlsa93wW1bjnnPEbJRfMbuEVgkBnvKzkpdMfEzJMEVmkgiq+WvCouMsRRKCh
         L9dYRAsYeezvjA0Ud4vxt8XIK8zLgYvRj3xukY6pBnOSzKzPV/rmndaKjpYpuCKrJvIo
         lxLfvcD2QkQTe0oj2ZP3m1IyFGcpuUcuCYHrlXtNaZjFBugHfeZ17e+A+Guwj08OsoDp
         zb+h7bbkoHrDavMsHaltRToELW4NQheQd9w5sRvCNai3nFmrnETe9/AiSuoQ/23EZIBN
         yhKGIRStCz49t/jlaBC2hZzJcXputsXveDVJzKTdfMfiMep7sQ7DU97yBW1EsCY5pWaR
         NC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729154075; x=1729758875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQ6DquZoc8pmgKL4myhwmN2reKV7rSzKiLlYiYUrabM=;
        b=UU1yG4liE5lDfEag8ALm55efs6U+DdazYXNcpu6sEmzVnHmZhgHqGNrqNtb8j+gGQt
         u7a74kZw1Yi1eBL117r6q162hKkkmZ++ek7FX58mPyx6h/Z/y5cIeUo8X67LEy3yanNF
         OIQhVAqNJ9BSkyidEVmUvkgNwqF0+oHjMCnEPWk99pfugXLg/BztQvjYB4WFPvnQNEML
         b5hBYqvIIC1+OGzHelyerHwXIDXdsLRmdwkujgHm59P5Wi79vX+PQuMVdcxn1vvbk2AF
         lRQFz1l2zRvbPUksnlK8DK2Q/n9jgDtVnT4z9Qgm2JeNzIkYUM6N+Ysm6cT7kRRqOp9I
         sXbQ==
X-Gm-Message-State: AOJu0YzZz/OC1ovVozKZcbm5o6XylrMIo8JLiXprcBP12GOQh3Mtnc4v
	/Ejh8BZWKGsNjjNelw7O90ErSGDUxycS8g6Oj3x0t9moV21Xd6VkzJmESZzuP1k=
X-Google-Smtp-Source: AGHT+IEPiPGII7wr51nNoVg9SZ+smF4cxlfMVH+91LP6iMWe7xd/p9YYpGzt/nzvHp+q2S8pIR/pLw==
X-Received: by 2002:a05:6512:6d2:b0:539:f4c1:71d3 with SMTP id 2adb3069b0e04-539f4c17406mr8382967e87.29.1729154074788;
        Thu, 17 Oct 2024 01:34:34 -0700 (PDT)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539fffb2713sm691297e87.114.2024.10.17.01.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 01:34:34 -0700 (PDT)
Date: Thu, 17 Oct 2024 11:34:32 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Gyorgy Szing <Gyorgy.Szing@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH v3 2/2] trusted-service: remove optee udev and
 group settings
Message-ID: <ZxDMGLYsOSe9rPFO@nuoska>
References: <20241017065907.172504-1-mikko.rapeli@linaro.org>
 <20241017065907.172504-2-mikko.rapeli@linaro.org>
 <AS8PR08MB589563A608DE289457643CA991472@AS8PR08MB5895.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR08MB589563A608DE289457643CA991472@AS8PR08MB5895.eurprd08.prod.outlook.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Oct 2024 08:34:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6206

Hi,

On Thu, Oct 17, 2024 at 08:17:32AM +0000, Gyorgy Szing wrote:
> How is the system going to work if op-tee client is not deployed, but libts is? E.g. if the SPMC is Hafnium and no S-EL1 OP-TEE SP is needed, but the FWU SP is used?

If optee-client is not installed, then optee is not functional
in Linux userspace and rootfs so optee-test fails. The plain
kernel driver for optee will work and /dev/tee* and /dev/teepriv* interfaces
will pop up with root access rights, but not with the setup expected by
tee-supplicant systemd service file from optee-client. This may be enough for TS
use cases.

In the firmware side, optee services are not affected.

If this impacts libts users, then IMO they need to install optee-client or
setup the udev rules etc in some other way.

Is there some problem I missed or a setup which is not covered in meta-arm testing?

Cheers,

-Mikko

