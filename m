Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.6411.1620287786880158946
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 May 2021 00:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FrbcN3JD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id s82so2811005wmf.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 06 May 2021 00:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=dN0/+6zNPYbLjwT/mLhehPzvWDCJFSr0vqixNSb7G5Y=;
        b=FrbcN3JDnj/4dnM8u1KFWuTi7O11wwcDDtbIlm++ZnIw2DM/AhmrDR9zg8hI7QuQjp
         Sb48FnKNACV1pf76bzvdEdSRFz0sh3ZvhreuH/+StWQbfZRPapbVcY7FWtlJEHUlXpIF
         CHJ5Y53qwK/qbqmiYVnUn3vesfURH5gOey1CI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=dN0/+6zNPYbLjwT/mLhehPzvWDCJFSr0vqixNSb7G5Y=;
        b=YdX5VeW9K2Ky5ZsPN78mZ5028U4U/0SFXThjbYxd8vSLocddSQQ/IAwIaOk6bGhFCx
         Q2rXNoAAcoOWkUP0U68sn0JMeZc9l9ilOVBdaFaFh9rwppE440KYCfursp87JAMGDMI4
         mf8dOSzNjJwKjkNsMwt/h42/C5puJDPQZrdutX1FnqIb5kXGpJVdGUPOlEiFoSNliHf6
         wL8yax0Zu4PkOnogsH5jG9nQ1Ua1GT2khfQ8k6uceFIKA+w2AqPf+hUL+h0wiRbxNvBN
         NbynA84N74KuQKOZwGUzIYexFEOA68P6xKhpxhC3jKLAtlgkMqiy9T6a3vbI6AwkRhAr
         MP7Q==
X-Gm-Message-State: AOAM532eZhCdCPOw66ULhhd04Y+FIt7b1ysRq+R+vYw3GEoQTC2F4OVK
	iG1co4aKZp4C3O4fDaKKIZNTMQ61KdQvEQ==
X-Google-Smtp-Source: ABdhPJwiBEHl+Wy32HhonOeaFjpicvvHkQ89XjKyeVl7UFyW4w1jl4822DDr7IS2Dlr5xdmkH5gDrw==
X-Received: by 2002:a1c:7315:: with SMTP id d21mr2559503wmb.155.1620287784215;
        Thu, 06 May 2021 00:56:24 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:d0ab:d9f1:6e0d:9f6e? ([2001:8b0:aba:5f3c:d0ab:d9f1:6e0d:9f6e])
        by smtp.gmail.com with ESMTPSA id j7sm2267040wmi.21.2021.05.06.00.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 00:56:23 -0700 (PDT)
Message-ID: <3001747eff87301c61701838708cb640babff979.camel@linuxfoundation.org>
Subject: uboot bbappend throwing warnings for master-next
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: meta-arm <meta-arm@lists.yoctoproject.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Thu, 06 May 2021 08:56:22 +0100
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi All,

master-next testing shows the u-boot upgrade in master-next will cause 
warnings for meta-arm:

https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/974

Cheers,

Richard

