Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web12.24637.1617409179894612831
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 02 Apr 2021 17:19:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lATN093g;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id x14so6584396qki.10
        for <meta-arm@lists.yoctoproject.org>; Fri, 02 Apr 2021 17:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=RBH0GSXjCehzqIikZz4aOwKJvCVrjMxwSaiahIK8hmE=;
        b=lATN093g83TmZx07C4cCGne2flQWjSi3CX3U4/5V8PYsiS7zfunbX+kw1AzBhtUEBd
         bSCpbPq7PA2vH/pTg0SbNj95tB1pMxSskRyMakUHoKI0vsnkwC3OP9LgekjTUe1jHF4S
         3O+6Y2ldb1g+RNq0eLs78ZqMVP23yyx2pemNImBLgNNEOlW0e1/73hm12HGjKaoEC1OV
         j2zVSg9UVLLbe/HNlnhpZDWSZsJhh14VychEpfYLjvHbwp8uN6W0pxQWtZMNI0Uh7cO1
         Ue/Oj6WOn0wJzDXv/1/9iWLgkJQhJagxqsCb/40+XGOdhUO/9z6TNumMbgXxe5An+SpK
         AgWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=RBH0GSXjCehzqIikZz4aOwKJvCVrjMxwSaiahIK8hmE=;
        b=X5jU2RzJli25/wjbMSaUsZR5uLMB33W7ce2suW0fcrHB6s1NffriqOoAe8Cz2WJ0pj
         asQk1XmaUmElWX0wN+IbeRaMDG77RnvMtv5sel4qEFIQRga6qFobPbGOgo3Z29UZ3uqT
         eYccBjYwl2S/noHkxYMsmtdMrg68w6iFQgBqyypvxXNc6mMkzxpOZuy17Cne1mpvQObx
         +sg/AZg8Mn0p689UdzCG9Ux4tV+l83qEpKPQ2z3TJ9GPjh+JP1ebKkzXwJaLN6f23S2u
         qRRkslUL2L6vjchd0Wns0aLWEGCDQlW+/6FCUY7F9v9e1+AY2F/2wcwtUIdDsd5BO3kK
         NiTA==
X-Gm-Message-State: AOAM53358x+mgz/LCzow6+1tRfav9/VJdZBk50TEpaOnW0W/Gs1SEOQD
	0ytsFLixrKvICd7J8Y/RxTr7DEQKXbmwVw0qymSkR9jfOxr3dw==
X-Google-Smtp-Source: ABdhPJyv9uMSxQuXtQcMHVwlnlzi+hnWD23DwiAEnDL2FG+DXIeiM54E+c2UCeP1NBPIz6PFv5OvyD59lN9bM7fqjqU=
X-Received: by 2002:a05:620a:12ae:: with SMTP id x14mr15625823qki.25.1617409178690;
 Fri, 02 Apr 2021 17:19:38 -0700 (PDT)
MIME-Version: 1.0
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 2 Apr 2021 17:19:12 -0700
Message-ID: <CAMKF1soZtavUBVCiGjFdOWU=LChYs-yUX81LTr1Jqcj7CxHUtg@mail.gmail.com>
Subject: sbsa-acs failing to build for not qemuarm64 machines
To: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

https://errors.yoctoproject.org/Errors/Details/575311/
https://errors.yoctoproject.org/Errors/Details/575302/

is this recipe aarch64 only? if so then it should appropriate
compatible_host
