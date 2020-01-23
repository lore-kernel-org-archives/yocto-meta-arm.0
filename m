Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web12.5840.1579775943914298214
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Jan 2020 02:39:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=TLisST+x;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id y6so2771676lji.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 23 Jan 2020 02:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=/xmN+BJ8KO304ecG+W6Uei9fFStDEwcQVGFnfn9p6Nc=;
        b=TLisST+x0oHFqlLQtl+gp3okucntvqMZzwfluIjdlIl2JCV3GKFNrII72qhl/khIBS
         gXoegbX0JNq9vmC07TDVB6IFnZ5Z3Wq0FRbhU/9z2Ct05Yk/XybXjK+EZ7Qo5TCW9LvM
         l9TU3ekyalOyVSj3+e/1UGKcfErAXjkNPsZLlCPNioyXYPFcParDnfPuChYmXEsSDsiJ
         y7eg/dy0iEFg/y2dU4DrvWxIgXiYp4iGQHqyb86VLfELi6qmATZTUU9+GU5I+I8XapUu
         OR5BZYgqUZDgt3BBP90n574ExzjDIDWj/FkRF7aX6eI81wKPOMw2oDVbPhc0W4xgKBXo
         /5tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=/xmN+BJ8KO304ecG+W6Uei9fFStDEwcQVGFnfn9p6Nc=;
        b=dt/Og828ROqmbsHVc2DBU3RQqHWkGZb9NX6d6UexRvDBSfJvd4i/yQ9jX2839DiMXF
         RLWCLBK28UhwcBLU/NvGr8Fy8KLNrY7FP4jmqlZ+1fgV3ddVtiqXKOolhOHfXEq2rYs+
         IPqs/Um7P/xfzzEuThl8/UyOcEKEApo56GAVRtPJTxSysvbaGEooEo+TsHHycvobRWov
         sA6pwTs90ycoGIbegC1e4IfM8rBrF1eejQRNO9Ug0IrEiwjuyS2Hgsf4LwidhOAlF6st
         GZQftmPI7VmW4LrgDQDLBI8MQqmbjsHfQO3aUv5RX5WHis6POlG6A3VMRDVqPfQHYh7q
         mojA==
X-Gm-Message-State: APjAAAVSDEeRZZau/KtFXgyZr4xyiOBubfZVTJW6v3v4kQsYnTyIs09+
	g590qYRgEV018euqsOZ1YvFeiu5IdqYkv+hx9moc+w==
X-Google-Smtp-Source: APXvYqykXK6BxpmJHcJgVpMjvzWdP4LTLi4MuY6nl96M/NN5FItwUg1MhcOei8hUZQtf4p0b0R8pVz5iRn0+Mdp5xzg=
X-Received: by 2002:a05:651c:30a:: with SMTP id a10mr22040193ljp.101.1579775941746;
 Thu, 23 Jan 2020 02:39:01 -0800 (PST)
MIME-Version: 1.0
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Thu, 23 Jan 2020 16:08:50 +0530
Message-ID: <CAFA6WYMS8Arp=nGhnf_4feXBfx7n9a-q6Tc4AXbQSafc+d0+oQ@mail.gmail.com>
Subject: Proposal to import ARM GCC toolchain recipes into meta-arm
To: jon.mason@arm.com, meta-arm@lists.yoctoproject.org
Cc: Daniel Thompson <daniel.thompson@linaro.org>, 
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Jon and all,

As you may be aware that Linaro used to maintain meta-linaro-toolchain
layer [1] in meta-linaro tree for GCC tool-set releases from Linaro
till GCC 7.

And since GCC 8, the tool-set release and maintenance work was
transferred to ARM. But meta-linaro-toolchain layer continued support
for ARM GCC tool-set releases as well.

In future, I think meta-arm tree [2] shall be an appropriate place to
host ARM GCC toolchain recipes as an additional meta-arm-toolchain
layer. Also, with the latest integration [3] for ARM GCC 9.2 toolchain
in meta-linaro, recipes are well tested and seems to be stable. So I
would like to propose import of ARM GCC toolchain recipes into
meta-arm.

I am looking forward to any comments or suggestions regarding this proposal.

[1] https://git.linaro.org/openembedded/meta-linaro.git/tree/meta-linaro-toolchain
[2] https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/
[3] https://lists.yoctoproject.org/g/yocto/message/48094

Regards,
Sumit
